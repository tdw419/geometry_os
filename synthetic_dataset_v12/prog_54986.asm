; DESCRIPTION: Renders a red line between points (425, 196) and (158, 86).
; PLAN: r0=425(x1), r1=196(y1), r2=158(x2), r3=86(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 196
LDI r2, 158
LDI r3, 86
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
