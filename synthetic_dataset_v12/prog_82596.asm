; DESCRIPTION: Places a green line segment connecting (373, 195) to (404, 98).
; PLAN: r0=373(x1), r1=195(y1), r2=404(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 195
LDI r2, 404
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
