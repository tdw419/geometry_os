; DESCRIPTION: Draws a magenta line from (251, 75) to (320, 94).
; PLAN: r0=251(x1), r1=75(y1), r2=320(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 75
LDI r2, 320
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
