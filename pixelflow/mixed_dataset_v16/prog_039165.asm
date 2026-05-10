; DESCRIPTION: Places a black line segment connecting (414, 33) to (228, 16).
; PLAN: r0=414(x1), r1=33(y1), r2=228(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 33
LDI r2, 228
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
