; DESCRIPTION: Places a magenta line segment connecting (77, 239) to (75, 81).
; PLAN: r0=77(x1), r1=239(y1), r2=75(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 239
LDI r2, 75
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
