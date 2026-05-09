; DESCRIPTION: Places a cyan line segment connecting (177, 52) to (253, 0).
; PLAN: r0=177(x1), r1=52(y1), r2=253(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 52
LDI r2, 253
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
