; DESCRIPTION: Renders a cyan line between points (148, 129) and (45, 211).
; PLAN: r0=148(x1), r1=129(y1), r2=45(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 129
LDI r2, 45
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
