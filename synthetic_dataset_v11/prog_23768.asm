; DESCRIPTION: Draws a white line from (144, 74) to (13, 240).
; PLAN: r0=144(x1), r1=74(y1), r2=13(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 74
LDI r2, 13
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
