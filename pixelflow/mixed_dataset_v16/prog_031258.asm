; DESCRIPTION: Draws a cyan line from (192, 252) to (133, 121).
; PLAN: r0=192(x1), r1=252(y1), r2=133(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 252
LDI r2, 133
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
