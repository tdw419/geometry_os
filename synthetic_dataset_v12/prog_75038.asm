; DESCRIPTION: Renders a blue box of size 97x55 starting at (214, 85).
; PLAN: r0=214(x), r1=85(y), r2=97(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 85
LDI r2, 97
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
