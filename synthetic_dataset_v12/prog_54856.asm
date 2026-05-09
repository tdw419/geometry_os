; DESCRIPTION: Places a green line segment connecting (404, 32) to (236, 65).
; PLAN: r0=404(x1), r1=32(y1), r2=236(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 32
LDI r2, 236
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
