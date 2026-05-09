; DESCRIPTION: Draws a orange line from (251, 213) to (255, 1).
; PLAN: r0=251(x1), r1=213(y1), r2=255(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 213
LDI r2, 255
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
