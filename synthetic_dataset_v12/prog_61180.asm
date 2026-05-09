; DESCRIPTION: Draws a green line from (359, 180) to (90, 254).
; PLAN: r0=359(x1), r1=180(y1), r2=90(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 180
LDI r2, 90
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
