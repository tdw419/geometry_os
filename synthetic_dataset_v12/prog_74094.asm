; DESCRIPTION: Renders a white line between points (79, 149) and (111, 15).
; PLAN: r0=79(x1), r1=149(y1), r2=111(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 149
LDI r2, 111
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
