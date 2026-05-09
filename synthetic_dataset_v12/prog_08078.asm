; DESCRIPTION: Places a green line segment connecting (175, 129) to (309, 102).
; PLAN: r0=175(x1), r1=129(y1), r2=309(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 129
LDI r2, 309
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
