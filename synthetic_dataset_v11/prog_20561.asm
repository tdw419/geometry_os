; DESCRIPTION: Places a black line segment connecting (105, 228) to (16, 109).
; PLAN: r0=105(x1), r1=228(y1), r2=16(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 228
LDI r2, 16
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
