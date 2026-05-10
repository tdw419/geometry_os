; DESCRIPTION: Places a green line segment connecting (200, 171) to (180, 182).
; PLAN: r0=200(x1), r1=171(y1), r2=180(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 171
LDI r2, 180
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
