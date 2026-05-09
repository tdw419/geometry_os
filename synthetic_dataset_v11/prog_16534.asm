; DESCRIPTION: Renders a black line between points (53, 153) and (67, 236).
; PLAN: r0=53(x1), r1=153(y1), r2=67(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 153
LDI r2, 67
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
