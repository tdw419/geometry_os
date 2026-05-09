; DESCRIPTION: Draws a black line from (0, 235) to (253, 215).
; PLAN: r0=0(x1), r1=235(y1), r2=253(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 235
LDI r2, 253
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
