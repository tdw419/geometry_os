; DESCRIPTION: Places a purple line segment connecting (166, 195) to (82, 20).
; PLAN: r0=166(x1), r1=195(y1), r2=82(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 195
LDI r2, 82
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
