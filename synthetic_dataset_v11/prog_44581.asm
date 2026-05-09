; DESCRIPTION: Renders a cyan line between points (233, 211) and (177, 8).
; PLAN: r0=233(x1), r1=211(y1), r2=177(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 211
LDI r2, 177
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
