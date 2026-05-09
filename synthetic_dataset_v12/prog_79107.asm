; DESCRIPTION: Renders a black line between points (52, 142) and (284, 94).
; PLAN: r0=52(x1), r1=142(y1), r2=284(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 142
LDI r2, 284
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
