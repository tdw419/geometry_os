; DESCRIPTION: Draws a blue line from (184, 239) to (5, 138).
; PLAN: r0=184(x1), r1=239(y1), r2=5(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 239
LDI r2, 5
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
