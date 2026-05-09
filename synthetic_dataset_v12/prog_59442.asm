; DESCRIPTION: Renders a cyan line between points (158, 5) and (506, 101).
; PLAN: r0=158(x1), r1=5(y1), r2=506(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 5
LDI r2, 506
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
