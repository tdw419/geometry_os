; DESCRIPTION: Renders a white line between points (35, 199) and (373, 128).
; PLAN: r0=35(x1), r1=199(y1), r2=373(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 199
LDI r2, 373
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
