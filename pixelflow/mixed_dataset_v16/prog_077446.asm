; DESCRIPTION: Creates a cyan rectangular region at (109, 1) spanning 22 by 101 pixels.
; PLAN: r0=109(x), r1=1(y), r2=22(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 1
LDI r2, 22
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
