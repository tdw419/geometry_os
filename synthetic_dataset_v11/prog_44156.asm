; DESCRIPTION: Renders a orange line between points (106, 107) and (18, 242).
; PLAN: r0=106(x1), r1=107(y1), r2=18(x2), r3=242(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 107
LDI r2, 18
LDI r3, 242
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
