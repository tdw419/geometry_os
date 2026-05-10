; DESCRIPTION: Renders a red line between points (337, 48) and (237, 144).
; PLAN: r0=337(x1), r1=48(y1), r2=237(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 48
LDI r2, 237
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
