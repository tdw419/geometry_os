; DESCRIPTION: Places a black line segment connecting (38, 252) to (81, 27).
; PLAN: r0=38(x1), r1=252(y1), r2=81(x2), r3=27(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 252
LDI r2, 81
LDI r3, 27
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
