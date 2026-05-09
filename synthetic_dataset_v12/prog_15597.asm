; DESCRIPTION: Renders a green line between points (77, 241) and (298, 192).
; PLAN: r0=77(x1), r1=241(y1), r2=298(x2), r3=192(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 241
LDI r2, 298
LDI r3, 192
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
