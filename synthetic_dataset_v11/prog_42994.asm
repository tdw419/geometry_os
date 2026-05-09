; DESCRIPTION: Renders a red line between points (98, 102) and (127, 43).
; PLAN: r0=98(x1), r1=102(y1), r2=127(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 102
LDI r2, 127
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
