; DESCRIPTION: Draws a cyan line from (498, 172) to (36, 116).
; PLAN: r0=498(x1), r1=172(y1), r2=36(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 172
LDI r2, 36
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
