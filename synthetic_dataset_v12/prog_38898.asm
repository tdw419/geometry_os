; DESCRIPTION: Draws a black line from (187, 241) to (164, 94).
; PLAN: r0=187(x1), r1=241(y1), r2=164(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 241
LDI r2, 164
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
