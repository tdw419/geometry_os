; DESCRIPTION: Places a orange line segment connecting (404, 235) to (108, 146).
; PLAN: r0=404(x1), r1=235(y1), r2=108(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 235
LDI r2, 108
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
