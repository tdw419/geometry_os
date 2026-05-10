; DESCRIPTION: Draws a yellow line from (497, 74) to (425, 13).
; PLAN: r0=497(x1), r1=74(y1), r2=425(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 74
LDI r2, 425
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
