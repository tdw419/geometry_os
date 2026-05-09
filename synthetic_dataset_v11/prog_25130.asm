; DESCRIPTION: Places a black line segment connecting (50, 73) to (74, 254).
; PLAN: r0=50(x1), r1=73(y1), r2=74(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 73
LDI r2, 74
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
