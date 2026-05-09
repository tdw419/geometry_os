; DESCRIPTION: Draws a blue line from (434, 75) to (65, 107).
; PLAN: r0=434(x1), r1=75(y1), r2=65(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 75
LDI r2, 65
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
