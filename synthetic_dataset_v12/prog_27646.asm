; DESCRIPTION: Renders a black line between points (432, 228) and (86, 255).
; PLAN: r0=432(x1), r1=228(y1), r2=86(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 228
LDI r2, 86
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
