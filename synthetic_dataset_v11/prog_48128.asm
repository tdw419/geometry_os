; DESCRIPTION: Places a white line segment connecting (213, 190) to (129, 186).
; PLAN: r0=213(x1), r1=190(y1), r2=129(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 190
LDI r2, 129
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
