; DESCRIPTION: Draws a black line from (39, 236) to (129, 103).
; PLAN: r0=39(x1), r1=236(y1), r2=129(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 236
LDI r2, 129
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
