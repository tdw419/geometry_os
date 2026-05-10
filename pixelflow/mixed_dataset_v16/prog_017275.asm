; DESCRIPTION: Renders a green line between points (441, 150) and (327, 11).
; PLAN: r0=441(x1), r1=150(y1), r2=327(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 150
LDI r2, 327
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
