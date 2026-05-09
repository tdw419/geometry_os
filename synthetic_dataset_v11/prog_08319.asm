; DESCRIPTION: Draws a black line from (230, 82) to (91, 15).
; PLAN: r0=230(x1), r1=82(y1), r2=91(x2), r3=15(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 82
LDI r2, 91
LDI r3, 15
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
