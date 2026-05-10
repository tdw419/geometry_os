; DESCRIPTION: Renders a orange line between points (79, 35) and (242, 240).
; PLAN: r0=79(x1), r1=35(y1), r2=242(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 35
LDI r2, 242
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
