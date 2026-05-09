; DESCRIPTION: Places a purple line segment connecting (196, 203) to (43, 228).
; PLAN: r0=196(x1), r1=203(y1), r2=43(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 203
LDI r2, 43
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
