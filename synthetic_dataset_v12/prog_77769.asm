; DESCRIPTION: Renders a black line between points (73, 20) and (373, 228).
; PLAN: r0=73(x1), r1=20(y1), r2=373(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 20
LDI r2, 373
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
