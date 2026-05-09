; DESCRIPTION: Places a white line segment connecting (19, 117) to (462, 246).
; PLAN: r0=19(x1), r1=117(y1), r2=462(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 117
LDI r2, 462
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
