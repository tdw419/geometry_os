; DESCRIPTION: Draws a yellow line from (30, 230) to (428, 21).
; PLAN: r0=30(x1), r1=230(y1), r2=428(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 230
LDI r2, 428
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
