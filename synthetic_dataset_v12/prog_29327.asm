; DESCRIPTION: Draws a black line from (197, 167) to (162, 107).
; PLAN: r0=197(x1), r1=167(y1), r2=162(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 167
LDI r2, 162
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
