; DESCRIPTION: Places a white line segment connecting (278, 129) to (186, 243).
; PLAN: r0=278(x1), r1=129(y1), r2=186(x2), r3=243(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 129
LDI r2, 186
LDI r3, 243
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
