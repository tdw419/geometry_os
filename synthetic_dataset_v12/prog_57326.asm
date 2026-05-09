; DESCRIPTION: Draws a cyan line from (366, 151) to (351, 230).
; PLAN: r0=366(x1), r1=151(y1), r2=351(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 151
LDI r2, 351
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
