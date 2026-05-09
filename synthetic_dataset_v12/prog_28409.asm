; DESCRIPTION: Renders a black line between points (105, 32) and (196, 50).
; PLAN: r0=105(x1), r1=32(y1), r2=196(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 32
LDI r2, 196
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
