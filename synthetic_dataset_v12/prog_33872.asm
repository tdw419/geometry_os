; DESCRIPTION: Draws a green line from (497, 112) to (75, 202).
; PLAN: r0=497(x1), r1=112(y1), r2=75(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 112
LDI r2, 75
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
