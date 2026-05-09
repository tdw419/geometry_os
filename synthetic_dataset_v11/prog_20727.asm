; DESCRIPTION: Renders a purple line between points (254, 228) and (99, 117).
; PLAN: r0=254(x1), r1=228(y1), r2=99(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 228
LDI r2, 99
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
