; DESCRIPTION: Draws a black line from (139, 215) to (208, 83).
; PLAN: r0=139(x1), r1=215(y1), r2=208(x2), r3=83(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 215
LDI r2, 208
LDI r3, 83
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
