; DESCRIPTION: Places a white line segment connecting (463, 219) to (404, 206).
; PLAN: r0=463(x1), r1=219(y1), r2=404(x2), r3=206(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 219
LDI r2, 404
LDI r3, 206
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
