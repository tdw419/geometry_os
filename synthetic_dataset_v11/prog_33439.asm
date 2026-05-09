; DESCRIPTION: Creates a cyan rectangular region at (88, 188) spanning 45 by 40 pixels.
; PLAN: r0=88(x), r1=188(y), r2=45(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 188
LDI r2, 45
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
