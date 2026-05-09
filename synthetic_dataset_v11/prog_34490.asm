; DESCRIPTION: Renders a yellow line between points (172, 228) and (193, 155).
; PLAN: r0=172(x1), r1=228(y1), r2=193(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 228
LDI r2, 193
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
