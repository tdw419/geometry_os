; DESCRIPTION: Draws a black line from (44, 38) to (196, 182).
; PLAN: r0=44(x1), r1=38(y1), r2=196(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 38
LDI r2, 196
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
