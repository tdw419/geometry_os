; DESCRIPTION: Draws a black line from (194, 56) to (263, 16).
; PLAN: r0=194(x1), r1=56(y1), r2=263(x2), r3=16(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 56
LDI r2, 263
LDI r3, 16
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
