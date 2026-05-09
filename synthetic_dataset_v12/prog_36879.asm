; DESCRIPTION: Renders a white line between points (494, 200) and (477, 231).
; PLAN: r0=494(x1), r1=200(y1), r2=477(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 200
LDI r2, 477
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
