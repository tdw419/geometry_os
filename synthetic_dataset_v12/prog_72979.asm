; DESCRIPTION: Places a black line segment connecting (81, 178) to (120, 255).
; PLAN: r0=81(x1), r1=178(y1), r2=120(x2), r3=255(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 178
LDI r2, 120
LDI r3, 255
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
