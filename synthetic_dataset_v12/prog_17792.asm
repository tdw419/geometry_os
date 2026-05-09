; DESCRIPTION: Renders a cyan line between points (0, 204) and (374, 129).
; PLAN: r0=0(x1), r1=204(y1), r2=374(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 204
LDI r2, 374
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
