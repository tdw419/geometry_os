; DESCRIPTION: Places a blue line segment connecting (18, 231) to (404, 210).
; PLAN: r0=18(x1), r1=231(y1), r2=404(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 231
LDI r2, 404
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
