; DESCRIPTION: Places a magenta line segment connecting (413, 3) to (387, 126).
; PLAN: r0=413(x1), r1=3(y1), r2=387(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 3
LDI r2, 387
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
