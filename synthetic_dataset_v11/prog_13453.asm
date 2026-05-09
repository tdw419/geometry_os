; DESCRIPTION: Places a magenta line segment connecting (253, 108) to (246, 113).
; PLAN: r0=253(x1), r1=108(y1), r2=246(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 108
LDI r2, 246
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
