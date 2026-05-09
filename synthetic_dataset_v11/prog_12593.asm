; DESCRIPTION: Renders a green line between points (204, 42) and (204, 90).
; PLAN: r0=204(x1), r1=42(y1), r2=204(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 42
LDI r2, 204
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
