; DESCRIPTION: Places a black line segment connecting (182, 63) to (209, 124).
; PLAN: r0=182(x1), r1=63(y1), r2=209(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 63
LDI r2, 209
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
