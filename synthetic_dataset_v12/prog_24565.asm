; DESCRIPTION: Renders a green line between points (493, 144) and (376, 187).
; PLAN: r0=493(x1), r1=144(y1), r2=376(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 144
LDI r2, 376
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
