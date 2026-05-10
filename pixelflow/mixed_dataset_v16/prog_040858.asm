; DESCRIPTION: Renders a yellow box of size 51x35 starting at (180, 147).
; PLAN: r0=180(x), r1=147(y), r2=51(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 147
LDI r2, 51
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
