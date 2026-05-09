; DESCRIPTION: Renders a cyan line between points (30, 52) and (136, 199).
; PLAN: r0=30(x1), r1=52(y1), r2=136(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 52
LDI r2, 136
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
