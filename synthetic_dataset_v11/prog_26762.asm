; DESCRIPTION: Draws a blue line from (22, 126) to (199, 236).
; PLAN: r0=22(x1), r1=126(y1), r2=199(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 126
LDI r2, 199
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
