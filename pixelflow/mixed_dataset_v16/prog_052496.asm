; DESCRIPTION: Places a magenta line segment connecting (203, 12) to (189, 83).
; PLAN: r0=203(x1), r1=12(y1), r2=189(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 12
LDI r2, 189
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
