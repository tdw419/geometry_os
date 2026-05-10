; DESCRIPTION: Draws a yellow line from (292, 120) to (13, 240).
; PLAN: r0=292(x1), r1=120(y1), r2=13(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 120
LDI r2, 13
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
