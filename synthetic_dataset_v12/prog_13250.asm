; DESCRIPTION: Renders a purple line between points (205, 141) and (450, 228).
; PLAN: r0=205(x1), r1=141(y1), r2=450(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 141
LDI r2, 450
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
