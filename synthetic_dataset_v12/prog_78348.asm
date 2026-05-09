; DESCRIPTION: Creates a cyan rectangular region at (16, 12) spanning 23 by 29 pixels.
; PLAN: r0=16(x), r1=12(y), r2=23(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 12
LDI r2, 23
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
