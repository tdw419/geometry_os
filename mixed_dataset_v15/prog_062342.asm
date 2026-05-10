; DESCRIPTION: Draws a black line from (7, 71) to (68, 180).
; PLAN: r0=7(x1), r1=71(y1), r2=68(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 71
LDI r2, 68
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
