; DESCRIPTION: Draws a black line from (167, 253) to (252, 237).
; PLAN: r0=167(x1), r1=253(y1), r2=252(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 253
LDI r2, 252
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
