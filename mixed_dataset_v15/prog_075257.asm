; DESCRIPTION: Places a green line segment connecting (171, 219) to (180, 10).
; PLAN: r0=171(x1), r1=219(y1), r2=180(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 219
LDI r2, 180
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
