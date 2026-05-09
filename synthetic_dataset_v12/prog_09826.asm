; DESCRIPTION: Renders a black line between points (82, 7) and (329, 249).
; PLAN: r0=82(x1), r1=7(y1), r2=329(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 7
LDI r2, 329
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
