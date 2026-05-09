; DESCRIPTION: Draws a black line from (39, 206) to (139, 237).
; PLAN: r0=39(x1), r1=206(y1), r2=139(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 206
LDI r2, 139
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
