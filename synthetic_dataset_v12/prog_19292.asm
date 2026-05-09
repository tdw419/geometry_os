; DESCRIPTION: Places a magenta line segment connecting (191, 239) to (140, 6).
; PLAN: r0=191(x1), r1=239(y1), r2=140(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 239
LDI r2, 140
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
