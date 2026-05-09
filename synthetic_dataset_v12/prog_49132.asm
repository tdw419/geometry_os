; DESCRIPTION: Renders a red line between points (246, 229) and (267, 33).
; PLAN: r0=246(x1), r1=229(y1), r2=267(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 229
LDI r2, 267
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
