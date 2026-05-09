; DESCRIPTION: Renders a yellow line between points (304, 225) and (140, 242).
; PLAN: r0=304(x1), r1=225(y1), r2=140(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 225
LDI r2, 140
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
