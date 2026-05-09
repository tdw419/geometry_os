; DESCRIPTION: Draws a cyan line from (107, 147) to (116, 99).
; PLAN: r0=107(x1), r1=147(y1), r2=116(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 147
LDI r2, 116
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
