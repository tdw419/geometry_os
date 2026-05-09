; DESCRIPTION: Draws a cyan line from (259, 121) to (133, 38).
; PLAN: r0=259(x1), r1=121(y1), r2=133(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 121
LDI r2, 133
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
