; DESCRIPTION: Draws a white line from (483, 45) to (220, 30).
; PLAN: r0=483(x1), r1=45(y1), r2=220(x2), r3=30(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 45
LDI r2, 220
LDI r3, 30
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
