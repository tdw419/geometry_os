; DESCRIPTION: Renders a red line between points (426, 237) and (154, 1).
; PLAN: r0=426(x1), r1=237(y1), r2=154(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 237
LDI r2, 154
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
