; DESCRIPTION: Renders a black line between points (294, 85) and (327, 61).
; PLAN: r0=294(x1), r1=85(y1), r2=327(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 85
LDI r2, 327
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
