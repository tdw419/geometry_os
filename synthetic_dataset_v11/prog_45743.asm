; DESCRIPTION: Renders a blue box of size 80x51 starting at (154, 142).
; PLAN: r0=154(x), r1=142(y), r2=80(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 142
LDI r2, 80
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
