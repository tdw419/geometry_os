; DESCRIPTION: Draws a cyan line from (155, 141) to (122, 72).
; PLAN: r0=155(x1), r1=141(y1), r2=122(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 141
LDI r2, 122
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
