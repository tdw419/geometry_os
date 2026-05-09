; DESCRIPTION: Places a white line segment connecting (267, 82) to (232, 120).
; PLAN: r0=267(x1), r1=82(y1), r2=232(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 82
LDI r2, 232
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
