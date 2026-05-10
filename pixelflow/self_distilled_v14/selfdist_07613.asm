; DESCRIPTION: Draws a cyan line from (35, 160) to (143, 116).
; PLAN: r0=35(x1), r1=160(y1), r2=143(x2), r3=116(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 160
LDI r2, 143
LDI r3, 116
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
