; DESCRIPTION: Places a green line segment connecting (176, 108) to (20, 95).
; PLAN: r0=176(x1), r1=108(y1), r2=20(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 108
LDI r2, 20
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
