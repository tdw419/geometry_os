; DESCRIPTION: Places a magenta line segment connecting (404, 248) to (206, 86).
; PLAN: r0=404(x1), r1=248(y1), r2=206(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 248
LDI r2, 206
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
