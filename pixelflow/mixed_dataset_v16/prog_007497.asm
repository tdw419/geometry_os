; DESCRIPTION: Creates a blue rectangular region at (23, 162) spanning 27 by 89 pixels.
; PLAN: r0=23(x), r1=162(y), r2=27(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 162
LDI r2, 27
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
