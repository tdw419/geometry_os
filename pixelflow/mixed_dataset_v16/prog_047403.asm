; DESCRIPTION: Renders a orange line between points (326, 27) and (317, 247).
; PLAN: r0=326(x1), r1=27(y1), r2=317(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 27
LDI r2, 317
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
