; DESCRIPTION: Places a magenta line segment connecting (254, 239) to (83, 248).
; PLAN: r0=254(x1), r1=239(y1), r2=83(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 239
LDI r2, 83
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
