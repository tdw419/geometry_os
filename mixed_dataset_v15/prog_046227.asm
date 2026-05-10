; DESCRIPTION: Places a green line segment connecting (125, 125) to (404, 68).
; PLAN: r0=125(x1), r1=125(y1), r2=404(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 125
LDI r2, 404
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
