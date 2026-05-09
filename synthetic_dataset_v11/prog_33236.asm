; DESCRIPTION: Renders a orange line between points (121, 107) and (209, 28).
; PLAN: r0=121(x1), r1=107(y1), r2=209(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 107
LDI r2, 209
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
