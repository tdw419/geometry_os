; DESCRIPTION: Places a yellow line segment connecting (184, 152) to (20, 50).
; PLAN: r0=184(x1), r1=152(y1), r2=20(x2), r3=50(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 152
LDI r2, 20
LDI r3, 50
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
