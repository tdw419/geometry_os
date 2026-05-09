; DESCRIPTION: Draws a cyan line from (116, 96) to (489, 199).
; PLAN: r0=116(x1), r1=96(y1), r2=489(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 96
LDI r2, 489
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
