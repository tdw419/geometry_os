; DESCRIPTION: Draws a cyan line from (495, 36) to (332, 116).
; PLAN: r0=495(x1), r1=36(y1), r2=332(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 36
LDI r2, 332
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
