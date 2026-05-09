; DESCRIPTION: Renders a red line between points (179, 196) and (86, 165).
; PLAN: r0=179(x1), r1=196(y1), r2=86(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 196
LDI r2, 86
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
