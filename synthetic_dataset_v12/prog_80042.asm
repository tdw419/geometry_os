; DESCRIPTION: Renders a purple line between points (39, 228) and (96, 5).
; PLAN: r0=39(x1), r1=228(y1), r2=96(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 228
LDI r2, 96
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
