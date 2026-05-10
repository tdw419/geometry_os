; DESCRIPTION: Renders a red line between points (240, 107) and (267, 161).
; PLAN: r0=240(x1), r1=107(y1), r2=267(x2), r3=161(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 107
LDI r2, 267
LDI r3, 161
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
