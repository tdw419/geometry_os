; DESCRIPTION: Places a black line segment connecting (228, 245) to (33, 30).
; PLAN: r0=228(x1), r1=245(y1), r2=33(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 245
LDI r2, 33
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
