; DESCRIPTION: Places a magenta line segment connecting (12, 203) to (273, 210).
; PLAN: r0=12(x1), r1=203(y1), r2=273(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 203
LDI r2, 273
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
