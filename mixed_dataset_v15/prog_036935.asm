; DESCRIPTION: Places a black line segment connecting (30, 138) to (204, 210).
; PLAN: r0=30(x1), r1=138(y1), r2=204(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 138
LDI r2, 204
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
