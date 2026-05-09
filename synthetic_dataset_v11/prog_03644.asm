; DESCRIPTION: Draws a green line from (75, 230) to (36, 135).
; PLAN: r0=75(x1), r1=230(y1), r2=36(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 230
LDI r2, 36
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
