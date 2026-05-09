; DESCRIPTION: Renders a green line between points (441, 125) and (64, 65).
; PLAN: r0=441(x1), r1=125(y1), r2=64(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 125
LDI r2, 64
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
