; DESCRIPTION: Draws a purple line from (480, 125) to (107, 82).
; PLAN: r0=480(x1), r1=125(y1), r2=107(x2), r3=82(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 125
LDI r2, 107
LDI r3, 82
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
