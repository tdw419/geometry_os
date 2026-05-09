; DESCRIPTION: Places a cyan line segment connecting (404, 80) to (164, 130).
; PLAN: r0=404(x1), r1=80(y1), r2=164(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 80
LDI r2, 164
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
