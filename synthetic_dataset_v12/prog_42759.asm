; DESCRIPTION: Renders a black line between points (483, 67) and (510, 50).
; PLAN: r0=483(x1), r1=67(y1), r2=510(x2), r3=50(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 67
LDI r2, 510
LDI r3, 50
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
