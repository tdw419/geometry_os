; DESCRIPTION: Places a magenta line segment connecting (68, 0) to (235, 239).
; PLAN: r0=68(x1), r1=0(y1), r2=235(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 0
LDI r2, 235
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
