; DESCRIPTION: Renders a blue box of size 88x87 starting at (143, 138).
; PLAN: r0=143(x), r1=138(y), r2=88(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 138
LDI r2, 88
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
