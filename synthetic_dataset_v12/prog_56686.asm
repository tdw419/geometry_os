; DESCRIPTION: Renders a green line between points (489, 177) and (12, 192).
; PLAN: r0=489(x1), r1=177(y1), r2=12(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 177
LDI r2, 12
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
