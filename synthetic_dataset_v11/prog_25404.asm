; DESCRIPTION: Draws a cyan line from (47, 174) to (221, 217).
; PLAN: r0=47(x1), r1=174(y1), r2=221(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 174
LDI r2, 221
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
