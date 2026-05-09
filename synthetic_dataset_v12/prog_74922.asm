; DESCRIPTION: Places a magenta line segment connecting (482, 25) to (20, 95).
; PLAN: r0=482(x1), r1=25(y1), r2=20(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 25
LDI r2, 20
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
