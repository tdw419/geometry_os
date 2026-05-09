; DESCRIPTION: Renders a red line between points (113, 12) and (208, 167).
; PLAN: r0=113(x1), r1=12(y1), r2=208(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 12
LDI r2, 208
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
