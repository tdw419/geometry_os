; DESCRIPTION: Renders a purple line between points (104, 132) and (218, 228).
; PLAN: r0=104(x1), r1=132(y1), r2=218(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 132
LDI r2, 218
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
