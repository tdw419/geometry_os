; DESCRIPTION: Renders a white line between points (64, 75) and (417, 44).
; PLAN: r0=64(x1), r1=75(y1), r2=417(x2), r3=44(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 75
LDI r2, 417
LDI r3, 44
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
