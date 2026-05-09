; DESCRIPTION: Renders a magenta line between points (439, 228) and (184, 145).
; PLAN: r0=439(x1), r1=228(y1), r2=184(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 228
LDI r2, 184
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
