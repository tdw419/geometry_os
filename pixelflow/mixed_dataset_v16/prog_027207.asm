; DESCRIPTION: Draws a magenta line from (375, 10) to (487, 97).
; PLAN: r0=375(x1), r1=10(y1), r2=487(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 10
LDI r2, 487
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
