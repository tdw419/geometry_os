; DESCRIPTION: Places a magenta line segment connecting (239, 252) to (117, 77).
; PLAN: r0=239(x1), r1=252(y1), r2=117(x2), r3=77(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 252
LDI r2, 117
LDI r3, 77
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
