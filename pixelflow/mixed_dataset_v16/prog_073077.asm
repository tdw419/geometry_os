; DESCRIPTION: Places a green line segment connecting (171, 36) to (300, 206).
; PLAN: r0=171(x1), r1=36(y1), r2=300(x2), r3=206(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 36
LDI r2, 300
LDI r3, 206
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
