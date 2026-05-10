; DESCRIPTION: Renders a green line between points (109, 250) and (12, 215).
; PLAN: r0=109(x1), r1=250(y1), r2=12(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 250
LDI r2, 12
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
