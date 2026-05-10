; DESCRIPTION: Draws a orange line from (127, 45) to (174, 120).
; PLAN: r0=127(x1), r1=45(y1), r2=174(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 45
LDI r2, 174
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
