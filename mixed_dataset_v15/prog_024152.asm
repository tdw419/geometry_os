; DESCRIPTION: Renders a purple line between points (446, 10) and (251, 228).
; PLAN: r0=446(x1), r1=10(y1), r2=251(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 10
LDI r2, 251
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
