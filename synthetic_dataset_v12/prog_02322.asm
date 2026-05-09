; DESCRIPTION: Places a blue line segment connecting (404, 164) to (58, 209).
; PLAN: r0=404(x1), r1=164(y1), r2=58(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 164
LDI r2, 58
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
