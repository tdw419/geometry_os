; DESCRIPTION: Renders a black line between points (276, 48) and (90, 223).
; PLAN: r0=276(x1), r1=48(y1), r2=90(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 48
LDI r2, 90
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
