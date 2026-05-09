; DESCRIPTION: Draws a cyan line from (114, 246) to (115, 206).
; PLAN: r0=114(x1), r1=246(y1), r2=115(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 246
LDI r2, 115
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
