; DESCRIPTION: Places a magenta line segment connecting (47, 239) to (32, 150).
; PLAN: r0=47(x1), r1=239(y1), r2=32(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 239
LDI r2, 32
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
