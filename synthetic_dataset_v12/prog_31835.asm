; DESCRIPTION: Places a magenta line segment connecting (29, 143) to (245, 103).
; PLAN: r0=29(x1), r1=143(y1), r2=245(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 143
LDI r2, 245
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
