; DESCRIPTION: Places a white line segment connecting (265, 245) to (302, 172).
; PLAN: r0=265(x1), r1=245(y1), r2=302(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 245
LDI r2, 302
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
