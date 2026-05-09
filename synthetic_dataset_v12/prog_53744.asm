; DESCRIPTION: Draws a green line from (462, 207) to (375, 251).
; PLAN: r0=462(x1), r1=207(y1), r2=375(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 207
LDI r2, 375
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
