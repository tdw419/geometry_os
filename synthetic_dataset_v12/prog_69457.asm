; DESCRIPTION: Renders a green line between points (493, 110) and (25, 146).
; PLAN: r0=493(x1), r1=110(y1), r2=25(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 110
LDI r2, 25
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
