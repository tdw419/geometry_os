; DESCRIPTION: Renders a yellow line between points (433, 0) and (242, 204).
; PLAN: r0=433(x1), r1=0(y1), r2=242(x2), r3=204(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 0
LDI r2, 242
LDI r3, 204
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
