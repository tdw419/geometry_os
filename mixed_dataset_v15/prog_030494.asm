; DESCRIPTION: Renders a yellow line between points (283, 65) and (477, 215).
; PLAN: r0=283(x1), r1=65(y1), r2=477(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 65
LDI r2, 477
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
