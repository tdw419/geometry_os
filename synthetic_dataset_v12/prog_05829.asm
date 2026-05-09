; DESCRIPTION: Renders a white line between points (85, 219) and (349, 242).
; PLAN: r0=85(x1), r1=219(y1), r2=349(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 219
LDI r2, 349
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
