; DESCRIPTION: Places a black line segment connecting (217, 94) to (27, 120).
; PLAN: r0=217(x1), r1=94(y1), r2=27(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 94
LDI r2, 27
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
