; DESCRIPTION: Renders a black line between points (429, 45) and (354, 19).
; PLAN: r0=429(x1), r1=45(y1), r2=354(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 45
LDI r2, 354
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
