; DESCRIPTION: Draws a black line from (90, 111) to (196, 114).
; PLAN: r0=90(x1), r1=111(y1), r2=196(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 111
LDI r2, 196
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
