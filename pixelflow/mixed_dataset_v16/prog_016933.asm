; DESCRIPTION: Places a black line segment connecting (377, 21) to (228, 165).
; PLAN: r0=377(x1), r1=21(y1), r2=228(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 21
LDI r2, 228
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
