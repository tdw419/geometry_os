; DESCRIPTION: Draws a cyan line from (137, 15) to (38, 181).
; PLAN: r0=137(x1), r1=15(y1), r2=38(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 15
LDI r2, 38
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
