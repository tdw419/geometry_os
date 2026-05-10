; DESCRIPTION: Places a white line segment connecting (125, 114) to (509, 241).
; PLAN: r0=125(x1), r1=114(y1), r2=509(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 114
LDI r2, 509
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
