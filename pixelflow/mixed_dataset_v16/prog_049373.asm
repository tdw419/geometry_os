; DESCRIPTION: Draws a black line from (197, 60) to (449, 202).
; PLAN: r0=197(x1), r1=60(y1), r2=449(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 60
LDI r2, 449
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
