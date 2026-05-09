; DESCRIPTION: Places a magenta line segment connecting (36, 230) to (206, 30).
; PLAN: r0=36(x1), r1=230(y1), r2=206(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 230
LDI r2, 206
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
