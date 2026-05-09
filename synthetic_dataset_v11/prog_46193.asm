; DESCRIPTION: Draws a black line from (93, 157) to (221, 125).
; PLAN: r0=93(x1), r1=157(y1), r2=221(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 157
LDI r2, 221
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
