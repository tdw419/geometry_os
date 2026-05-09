; DESCRIPTION: Places a magenta line segment connecting (239, 71) to (77, 209).
; PLAN: r0=239(x1), r1=71(y1), r2=77(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 71
LDI r2, 77
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
