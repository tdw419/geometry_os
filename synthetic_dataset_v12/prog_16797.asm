; DESCRIPTION: Creates a blue rectangular region at (162, 27) spanning 36 by 49 pixels.
; PLAN: r0=162(x), r1=27(y), r2=36(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 27
LDI r2, 36
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
