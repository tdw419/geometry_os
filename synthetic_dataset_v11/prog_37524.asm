; DESCRIPTION: Draws a cyan line from (227, 236) to (230, 217).
; PLAN: r0=227(x1), r1=236(y1), r2=230(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 236
LDI r2, 230
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
