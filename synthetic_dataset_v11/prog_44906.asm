; DESCRIPTION: Draws a black line from (238, 21) to (82, 26).
; PLAN: r0=238(x1), r1=21(y1), r2=82(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 21
LDI r2, 82
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
