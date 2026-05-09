; DESCRIPTION: Draws a cyan line from (278, 251) to (353, 141).
; PLAN: r0=278(x1), r1=251(y1), r2=353(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 251
LDI r2, 353
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
