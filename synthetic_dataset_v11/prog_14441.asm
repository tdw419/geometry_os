; DESCRIPTION: Draws a cyan line from (221, 121) to (195, 158).
; PLAN: r0=221(x1), r1=121(y1), r2=195(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 121
LDI r2, 195
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
