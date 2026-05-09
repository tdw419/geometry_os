; DESCRIPTION: Draws a green line from (375, 223) to (377, 78).
; PLAN: r0=375(x1), r1=223(y1), r2=377(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 223
LDI r2, 377
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
