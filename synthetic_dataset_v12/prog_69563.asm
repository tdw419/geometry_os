; DESCRIPTION: Draws a cyan line from (427, 79) to (315, 254).
; PLAN: r0=427(x1), r1=79(y1), r2=315(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 79
LDI r2, 315
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
