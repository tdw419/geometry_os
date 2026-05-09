; DESCRIPTION: Places a magenta line segment connecting (493, 2) to (404, 166).
; PLAN: r0=493(x1), r1=2(y1), r2=404(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 2
LDI r2, 404
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
