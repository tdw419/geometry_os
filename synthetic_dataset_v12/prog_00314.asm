; DESCRIPTION: Draws a black line from (184, 134) to (263, 2).
; PLAN: r0=184(x1), r1=134(y1), r2=263(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 134
LDI r2, 263
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
