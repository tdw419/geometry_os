; DESCRIPTION: Draws a yellow line from (60, 180) to (321, 8).
; PLAN: r0=60(x1), r1=180(y1), r2=321(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 180
LDI r2, 321
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
