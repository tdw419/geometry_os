; DESCRIPTION: Draws a white line from (450, 234) to (491, 25).
; PLAN: r0=450(x1), r1=234(y1), r2=491(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 234
LDI r2, 491
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
