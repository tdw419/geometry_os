; DESCRIPTION: Draws a cyan line from (104, 137) to (477, 244).
; PLAN: r0=104(x1), r1=137(y1), r2=477(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 137
LDI r2, 477
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
