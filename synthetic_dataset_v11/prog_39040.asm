; DESCRIPTION: Creates a cyan rectangular region at (21, 188) spanning 19 by 23 pixels.
; PLAN: r0=21(x), r1=188(y), r2=19(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 188
LDI r2, 19
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
