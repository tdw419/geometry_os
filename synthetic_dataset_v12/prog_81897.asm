; DESCRIPTION: Renders a black line between points (284, 132) and (34, 56).
; PLAN: r0=284(x1), r1=132(y1), r2=34(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 132
LDI r2, 34
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
