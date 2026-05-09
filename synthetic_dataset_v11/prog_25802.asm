; DESCRIPTION: Renders a purple line between points (182, 240) and (186, 228).
; PLAN: r0=182(x1), r1=240(y1), r2=186(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 240
LDI r2, 186
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
