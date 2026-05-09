; DESCRIPTION: Places a magenta line segment connecting (119, 50) to (184, 210).
; PLAN: r0=119(x1), r1=50(y1), r2=184(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 50
LDI r2, 184
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
