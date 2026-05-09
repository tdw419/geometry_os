; DESCRIPTION: Draws a black line from (151, 129) to (499, 101).
; PLAN: r0=151(x1), r1=129(y1), r2=499(x2), r3=101(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 129
LDI r2, 499
LDI r3, 101
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
