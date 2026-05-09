; DESCRIPTION: Renders a black line between points (412, 31) and (354, 121).
; PLAN: r0=412(x1), r1=31(y1), r2=354(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 31
LDI r2, 354
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
