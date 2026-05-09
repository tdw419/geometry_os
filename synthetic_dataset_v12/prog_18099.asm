; DESCRIPTION: Draws a blue line from (368, 94) to (122, 27).
; PLAN: r0=368(x1), r1=94(y1), r2=122(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 94
LDI r2, 122
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
