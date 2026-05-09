; DESCRIPTION: Renders a black line between points (383, 31) and (378, 42).
; PLAN: r0=383(x1), r1=31(y1), r2=378(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 31
LDI r2, 378
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
