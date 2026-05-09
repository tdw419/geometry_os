; DESCRIPTION: Draws a black line from (168, 192) to (19, 7).
; PLAN: r0=168(x1), r1=192(y1), r2=19(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 192
LDI r2, 19
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
