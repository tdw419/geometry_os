; DESCRIPTION: Renders a white line between points (57, 218) and (212, 95).
; PLAN: r0=57(x1), r1=218(y1), r2=212(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 218
LDI r2, 212
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
