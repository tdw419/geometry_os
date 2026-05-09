; DESCRIPTION: Draws a cyan line from (316, 116) to (278, 254).
; PLAN: r0=316(x1), r1=116(y1), r2=278(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 116
LDI r2, 278
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
