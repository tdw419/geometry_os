; DESCRIPTION: Places a white line segment connecting (187, 81) to (245, 204).
; PLAN: r0=187(x1), r1=81(y1), r2=245(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 81
LDI r2, 245
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
