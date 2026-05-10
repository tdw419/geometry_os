; DESCRIPTION: Renders a magenta line between points (276, 39) and (31, 184).
; PLAN: r0=276(x1), r1=39(y1), r2=31(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 39
LDI r2, 31
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
