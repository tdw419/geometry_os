; DESCRIPTION: Places a green line segment connecting (305, 63) to (112, 182).
; PLAN: r0=305(x1), r1=63(y1), r2=112(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 63
LDI r2, 112
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
