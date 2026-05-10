; DESCRIPTION: Draws a cyan line from (391, 158) to (86, 116).
; PLAN: r0=391(x1), r1=158(y1), r2=86(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 158
LDI r2, 86
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
