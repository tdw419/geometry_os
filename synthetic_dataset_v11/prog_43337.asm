; DESCRIPTION: Places a black line segment connecting (82, 19) to (154, 88).
; PLAN: r0=82(x1), r1=19(y1), r2=154(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 19
LDI r2, 154
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
