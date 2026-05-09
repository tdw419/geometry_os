; DESCRIPTION: Places a magenta line segment connecting (269, 235) to (313, 125).
; PLAN: r0=269(x1), r1=235(y1), r2=313(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 235
LDI r2, 313
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
