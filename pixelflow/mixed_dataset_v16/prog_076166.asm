; DESCRIPTION: Draws a orange line from (332, 9) to (464, 171).
; PLAN: r0=332(x1), r1=9(y1), r2=464(x2), r3=171(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 9
LDI r2, 464
LDI r3, 171
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
