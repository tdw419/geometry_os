; DESCRIPTION: Renders a white line between points (176, 18) and (13, 132).
; PLAN: r0=176(x1), r1=18(y1), r2=13(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 18
LDI r2, 13
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
