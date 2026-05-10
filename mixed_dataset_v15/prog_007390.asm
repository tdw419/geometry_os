; DESCRIPTION: Draws a black line from (317, 180) to (335, 86).
; PLAN: r0=317(x1), r1=180(y1), r2=335(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 180
LDI r2, 335
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
