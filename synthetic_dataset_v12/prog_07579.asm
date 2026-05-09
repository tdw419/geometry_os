; DESCRIPTION: Places a yellow line segment connecting (404, 108) to (178, 235).
; PLAN: r0=404(x1), r1=108(y1), r2=178(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 108
LDI r2, 178
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
