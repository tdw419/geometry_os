; DESCRIPTION: Renders a cyan line between points (253, 242) and (287, 77).
; PLAN: r0=253(x1), r1=242(y1), r2=287(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 242
LDI r2, 287
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
