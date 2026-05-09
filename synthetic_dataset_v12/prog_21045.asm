; DESCRIPTION: Places a yellow line segment connecting (328, 223) to (1, 48).
; PLAN: r0=328(x1), r1=223(y1), r2=1(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 223
LDI r2, 1
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
