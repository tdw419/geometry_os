; DESCRIPTION: Renders a black line between points (482, 58) and (90, 153).
; PLAN: r0=482(x1), r1=58(y1), r2=90(x2), r3=153(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 58
LDI r2, 90
LDI r3, 153
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
