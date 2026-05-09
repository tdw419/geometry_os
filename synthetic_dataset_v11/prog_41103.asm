; DESCRIPTION: Renders a green line between points (250, 215) and (0, 29).
; PLAN: r0=250(x1), r1=215(y1), r2=0(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 215
LDI r2, 0
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
