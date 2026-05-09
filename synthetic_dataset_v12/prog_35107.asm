; DESCRIPTION: Renders a black line between points (183, 196) and (286, 56).
; PLAN: r0=183(x1), r1=196(y1), r2=286(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 196
LDI r2, 286
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
