; DESCRIPTION: Renders a black line between points (168, 197) and (132, 1).
; PLAN: r0=168(x1), r1=197(y1), r2=132(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 197
LDI r2, 132
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
