; DESCRIPTION: Renders a black line between points (178, 3) and (510, 24).
; PLAN: r0=178(x1), r1=3(y1), r2=510(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 3
LDI r2, 510
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
