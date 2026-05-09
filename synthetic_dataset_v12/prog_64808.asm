; DESCRIPTION: Draws a black line from (40, 88) to (228, 3).
; PLAN: r0=40(x1), r1=88(y1), r2=228(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 88
LDI r2, 228
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
