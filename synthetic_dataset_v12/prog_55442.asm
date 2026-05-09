; DESCRIPTION: Draws a cyan line from (337, 143) to (328, 53).
; PLAN: r0=337(x1), r1=143(y1), r2=328(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 143
LDI r2, 328
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
