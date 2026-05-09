; DESCRIPTION: Renders a yellow line between points (267, 172) and (308, 146).
; PLAN: r0=267(x1), r1=172(y1), r2=308(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 172
LDI r2, 308
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
