; DESCRIPTION: Draws a black line from (156, 74) to (180, 3).
; PLAN: r0=156(x1), r1=74(y1), r2=180(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 74
LDI r2, 180
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
