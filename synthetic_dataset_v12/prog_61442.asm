; DESCRIPTION: Places a black line segment connecting (50, 95) to (346, 254).
; PLAN: r0=50(x1), r1=95(y1), r2=346(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 95
LDI r2, 346
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
