; DESCRIPTION: Draws a black line from (168, 106) to (388, 39).
; PLAN: r0=168(x1), r1=106(y1), r2=388(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 106
LDI r2, 388
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
