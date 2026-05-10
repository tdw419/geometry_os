; DESCRIPTION: Draws a black line from (202, 253) to (34, 227).
; PLAN: r0=202(x1), r1=253(y1), r2=34(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 253
LDI r2, 34
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
