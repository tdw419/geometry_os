; DESCRIPTION: Places a magenta line segment connecting (235, 209) to (91, 138).
; PLAN: r0=235(x1), r1=209(y1), r2=91(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 209
LDI r2, 91
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
