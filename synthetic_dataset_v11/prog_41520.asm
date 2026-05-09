; DESCRIPTION: Renders a white line between points (112, 52) and (176, 228).
; PLAN: r0=112(x1), r1=52(y1), r2=176(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 52
LDI r2, 176
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
