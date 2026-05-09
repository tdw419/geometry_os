; DESCRIPTION: Renders a purple line between points (347, 120) and (230, 228).
; PLAN: r0=347(x1), r1=120(y1), r2=230(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 120
LDI r2, 230
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
