; DESCRIPTION: Places a black line segment connecting (228, 83) to (358, 29).
; PLAN: r0=228(x1), r1=83(y1), r2=358(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 83
LDI r2, 358
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
