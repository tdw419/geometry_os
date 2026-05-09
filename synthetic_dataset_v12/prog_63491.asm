; DESCRIPTION: Places a green line segment connecting (6, 164) to (271, 208).
; PLAN: r0=6(x1), r1=164(y1), r2=271(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 164
LDI r2, 271
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
