; DESCRIPTION: Draws a purple line from (317, 175) to (174, 198).
; PLAN: r0=317(x1), r1=175(y1), r2=174(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 175
LDI r2, 174
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
