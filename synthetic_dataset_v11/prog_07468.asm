; DESCRIPTION: Places a magenta line segment connecting (136, 173) to (246, 174).
; PLAN: r0=136(x1), r1=173(y1), r2=246(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 173
LDI r2, 246
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
