; DESCRIPTION: Draws a black line from (40, 239) to (118, 24).
; PLAN: r0=40(x1), r1=239(y1), r2=118(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 239
LDI r2, 118
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
