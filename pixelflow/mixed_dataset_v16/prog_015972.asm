; DESCRIPTION: Places a yellow line segment connecting (361, 233) to (271, 184).
; PLAN: r0=361(x1), r1=233(y1), r2=271(x2), r3=184(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 233
LDI r2, 271
LDI r3, 184
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
