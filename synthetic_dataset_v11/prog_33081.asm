; DESCRIPTION: Renders a black line between points (126, 23) and (8, 56).
; PLAN: r0=126(x1), r1=23(y1), r2=8(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 23
LDI r2, 8
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
