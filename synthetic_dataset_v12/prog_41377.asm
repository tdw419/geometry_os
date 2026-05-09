; DESCRIPTION: Renders a magenta line between points (53, 31) and (374, 37).
; PLAN: r0=53(x1), r1=31(y1), r2=374(x2), r3=37(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 31
LDI r2, 374
LDI r3, 37
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
