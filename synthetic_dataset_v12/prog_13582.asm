; DESCRIPTION: Draws a black line from (307, 117) to (286, 233).
; PLAN: r0=307(x1), r1=117(y1), r2=286(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 117
LDI r2, 286
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
