; DESCRIPTION: Renders a black line between points (40, 27) and (217, 131).
; PLAN: r0=40(x1), r1=27(y1), r2=217(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 27
LDI r2, 217
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
