; DESCRIPTION: Renders a black line between points (393, 228) and (335, 182).
; PLAN: r0=393(x1), r1=228(y1), r2=335(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 228
LDI r2, 335
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
