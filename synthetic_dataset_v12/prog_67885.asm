; DESCRIPTION: Draws a magenta line from (237, 235) to (238, 239).
; PLAN: r0=237(x1), r1=235(y1), r2=238(x2), r3=239(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 235
LDI r2, 238
LDI r3, 239
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
