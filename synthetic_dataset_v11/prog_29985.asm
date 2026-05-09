; DESCRIPTION: Renders a green line between points (185, 129) and (43, 242).
; PLAN: r0=185(x1), r1=129(y1), r2=43(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 129
LDI r2, 43
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
