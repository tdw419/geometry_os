; DESCRIPTION: Draws a black line from (52, 148) to (138, 29).
; PLAN: r0=52(x1), r1=148(y1), r2=138(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 148
LDI r2, 138
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
