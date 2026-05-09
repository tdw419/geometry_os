; DESCRIPTION: Places a magenta line segment connecting (219, 209) to (284, 119).
; PLAN: r0=219(x1), r1=209(y1), r2=284(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 209
LDI r2, 284
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
