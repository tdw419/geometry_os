; DESCRIPTION: Draws a black line from (135, 74) to (237, 5).
; PLAN: r0=135(x1), r1=74(y1), r2=237(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 74
LDI r2, 237
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
