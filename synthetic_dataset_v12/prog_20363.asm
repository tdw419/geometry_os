; DESCRIPTION: Places a green line segment connecting (83, 129) to (81, 243).
; PLAN: r0=83(x1), r1=129(y1), r2=81(x2), r3=243(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 129
LDI r2, 81
LDI r3, 243
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
