; DESCRIPTION: Places a magenta line segment connecting (241, 50) to (32, 199).
; PLAN: r0=241(x1), r1=50(y1), r2=32(x2), r3=199(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 50
LDI r2, 32
LDI r3, 199
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
