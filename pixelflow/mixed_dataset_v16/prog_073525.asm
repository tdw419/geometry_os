; DESCRIPTION: Draws a black line from (157, 149) to (304, 187).
; PLAN: r0=157(x1), r1=149(y1), r2=304(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 149
LDI r2, 304
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
