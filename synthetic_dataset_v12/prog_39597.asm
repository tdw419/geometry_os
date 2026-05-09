; DESCRIPTION: Renders a orange line between points (442, 254) and (279, 131).
; PLAN: r0=442(x1), r1=254(y1), r2=279(x2), r3=131(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 254
LDI r2, 279
LDI r3, 131
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
