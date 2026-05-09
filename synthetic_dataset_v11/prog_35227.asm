; DESCRIPTION: Renders a orange line between points (242, 191) and (39, 24).
; PLAN: r0=242(x1), r1=191(y1), r2=39(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 191
LDI r2, 39
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
