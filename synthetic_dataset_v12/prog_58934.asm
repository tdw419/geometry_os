; DESCRIPTION: Draws a magenta line from (413, 9) to (475, 33).
; PLAN: r0=413(x1), r1=9(y1), r2=475(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 9
LDI r2, 475
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
