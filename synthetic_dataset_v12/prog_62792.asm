; DESCRIPTION: Places a white line segment connecting (281, 222) to (74, 129).
; PLAN: r0=281(x1), r1=222(y1), r2=74(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 222
LDI r2, 74
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
