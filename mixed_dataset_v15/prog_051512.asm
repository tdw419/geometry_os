; DESCRIPTION: Places a white line segment connecting (177, 170) to (509, 28).
; PLAN: r0=177(x1), r1=170(y1), r2=509(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 170
LDI r2, 509
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
