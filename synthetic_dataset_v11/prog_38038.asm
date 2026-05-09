; DESCRIPTION: Draws a black line from (233, 253) to (208, 207).
; PLAN: r0=233(x1), r1=253(y1), r2=208(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 253
LDI r2, 208
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
