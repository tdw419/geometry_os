; DESCRIPTION: Renders a blue box of size 70x80 starting at (260, 51).
; PLAN: r0=260(x), r1=51(y), r2=70(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 51
LDI r2, 70
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
