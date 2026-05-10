; DESCRIPTION: Renders a cyan line between points (408, 177) and (341, 49).
; PLAN: r0=408(x1), r1=177(y1), r2=341(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 177
LDI r2, 341
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
