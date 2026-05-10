; DESCRIPTION: Renders a orange line between points (164, 231) and (454, 132).
; PLAN: r0=164(x1), r1=231(y1), r2=454(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 231
LDI r2, 454
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
