; DESCRIPTION: Draws a black line from (146, 197) to (43, 197).
; PLAN: r0=146(x1), r1=197(y1), r2=43(x2), r3=197(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 197
LDI r2, 43
LDI r3, 197
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
