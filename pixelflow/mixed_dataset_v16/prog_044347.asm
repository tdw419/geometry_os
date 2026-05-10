; DESCRIPTION: Places a white line segment connecting (265, 176) to (454, 146).
; PLAN: r0=265(x1), r1=176(y1), r2=454(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 176
LDI r2, 454
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
