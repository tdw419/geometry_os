; DESCRIPTION: Places a yellow line segment connecting (403, 180) to (48, 73).
; PLAN: r0=403(x1), r1=180(y1), r2=48(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 180
LDI r2, 48
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
