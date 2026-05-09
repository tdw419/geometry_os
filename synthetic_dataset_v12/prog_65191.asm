; DESCRIPTION: Places a magenta line segment connecting (271, 152) to (282, 98).
; PLAN: r0=271(x1), r1=152(y1), r2=282(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 152
LDI r2, 282
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
