; DESCRIPTION: Places a magenta line segment connecting (206, 79) to (208, 239).
; PLAN: r0=206(x1), r1=79(y1), r2=208(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 79
LDI r2, 208
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
