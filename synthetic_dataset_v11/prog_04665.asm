; DESCRIPTION: Renders a yellow line between points (247, 189) and (176, 242).
; PLAN: r0=247(x1), r1=189(y1), r2=176(x2), r3=242(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 189
LDI r2, 176
LDI r3, 242
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
