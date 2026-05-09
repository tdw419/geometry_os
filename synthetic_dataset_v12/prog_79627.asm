; DESCRIPTION: Renders a yellow line between points (246, 1) and (434, 178).
; PLAN: r0=246(x1), r1=1(y1), r2=434(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 1
LDI r2, 434
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
