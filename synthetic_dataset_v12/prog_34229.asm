; DESCRIPTION: Renders a red line between points (253, 210) and (307, 9).
; PLAN: r0=253(x1), r1=210(y1), r2=307(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 210
LDI r2, 307
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
