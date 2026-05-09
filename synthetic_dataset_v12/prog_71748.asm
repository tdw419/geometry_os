; DESCRIPTION: Draws a orange line from (487, 75) to (393, 91).
; PLAN: r0=487(x1), r1=75(y1), r2=393(x2), r3=91(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 75
LDI r2, 393
LDI r3, 91
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
