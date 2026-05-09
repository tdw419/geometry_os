; DESCRIPTION: Renders a cyan line between points (105, 36) and (253, 250).
; PLAN: r0=105(x1), r1=36(y1), r2=253(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 36
LDI r2, 253
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
