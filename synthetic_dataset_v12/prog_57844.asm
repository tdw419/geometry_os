; DESCRIPTION: Draws a black line from (460, 68) to (194, 253).
; PLAN: r0=460(x1), r1=68(y1), r2=194(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 68
LDI r2, 194
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
