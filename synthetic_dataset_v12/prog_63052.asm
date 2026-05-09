; DESCRIPTION: Draws a black line from (446, 29) to (491, 202).
; PLAN: r0=446(x1), r1=29(y1), r2=491(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 29
LDI r2, 491
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
