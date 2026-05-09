; DESCRIPTION: Places a blue line segment connecting (111, 223) to (245, 43).
; PLAN: r0=111(x1), r1=223(y1), r2=245(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 223
LDI r2, 245
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
