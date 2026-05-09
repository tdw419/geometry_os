; DESCRIPTION: Draws a orange line from (487, 117) to (350, 108).
; PLAN: r0=487(x1), r1=117(y1), r2=350(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 117
LDI r2, 350
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
