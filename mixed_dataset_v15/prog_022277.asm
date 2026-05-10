; DESCRIPTION: Places a yellow line segment connecting (401, 113) to (63, 232).
; PLAN: r0=401(x1), r1=113(y1), r2=63(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 113
LDI r2, 63
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
