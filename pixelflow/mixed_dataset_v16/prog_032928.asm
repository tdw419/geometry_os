; DESCRIPTION: Places a purple line segment connecting (246, 247) to (82, 86).
; PLAN: r0=246(x1), r1=247(y1), r2=82(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 247
LDI r2, 82
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
