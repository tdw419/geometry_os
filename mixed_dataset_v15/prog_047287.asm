; DESCRIPTION: Draws a cyan line from (309, 160) to (189, 217).
; PLAN: r0=309(x1), r1=160(y1), r2=189(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 160
LDI r2, 189
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
