; DESCRIPTION: Draws a magenta line from (470, 235) to (29, 239).
; PLAN: r0=470(x1), r1=235(y1), r2=29(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 235
LDI r2, 29
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
