; DESCRIPTION: Draws a black line from (430, 239) to (253, 3).
; PLAN: r0=430(x1), r1=239(y1), r2=253(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 239
LDI r2, 253
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
