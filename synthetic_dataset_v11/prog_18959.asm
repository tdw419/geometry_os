; DESCRIPTION: Places a red line segment connecting (196, 164) to (8, 224).
; PLAN: r0=196(x1), r1=164(y1), r2=8(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 164
LDI r2, 8
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
