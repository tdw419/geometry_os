; DESCRIPTION: Draws a black line from (213, 207) to (2, 197).
; PLAN: r0=213(x1), r1=207(y1), r2=2(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 207
LDI r2, 2
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
