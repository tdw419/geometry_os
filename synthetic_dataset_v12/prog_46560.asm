; DESCRIPTION: Draws a black line from (402, 27) to (182, 106).
; PLAN: r0=402(x1), r1=27(y1), r2=182(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 27
LDI r2, 182
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
