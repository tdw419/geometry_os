; DESCRIPTION: Renders a magenta line between points (267, 246) and (298, 250).
; PLAN: r0=267(x1), r1=246(y1), r2=298(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 246
LDI r2, 298
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
