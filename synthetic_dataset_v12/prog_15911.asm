; DESCRIPTION: Draws a magenta line from (251, 220) to (346, 155).
; PLAN: r0=251(x1), r1=220(y1), r2=346(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 220
LDI r2, 346
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
