; DESCRIPTION: Renders a red line between points (391, 86) and (267, 107).
; PLAN: r0=391(x1), r1=86(y1), r2=267(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 86
LDI r2, 267
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
