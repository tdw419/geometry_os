; DESCRIPTION: Places a white line segment connecting (50, 93) to (477, 63).
; PLAN: r0=50(x1), r1=93(y1), r2=477(x2), r3=63(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 93
LDI r2, 477
LDI r3, 63
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
