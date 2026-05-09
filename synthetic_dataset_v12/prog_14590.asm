; DESCRIPTION: Renders a yellow line between points (95, 130) and (439, 117).
; PLAN: r0=95(x1), r1=130(y1), r2=439(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 130
LDI r2, 439
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
