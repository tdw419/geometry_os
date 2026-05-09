; DESCRIPTION: Places a white line segment connecting (213, 129) to (61, 102).
; PLAN: r0=213(x1), r1=129(y1), r2=61(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 129
LDI r2, 61
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
