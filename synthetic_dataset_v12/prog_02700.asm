; DESCRIPTION: Places a magenta line segment connecting (434, 227) to (345, 239).
; PLAN: r0=434(x1), r1=227(y1), r2=345(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 227
LDI r2, 345
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
