; DESCRIPTION: Renders a yellow line between points (242, 207) and (177, 83).
; PLAN: r0=242(x1), r1=207(y1), r2=177(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 207
LDI r2, 177
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
