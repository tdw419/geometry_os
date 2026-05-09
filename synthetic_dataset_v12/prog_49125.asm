; DESCRIPTION: Places a purple line segment connecting (267, 42) to (223, 246).
; PLAN: r0=267(x1), r1=42(y1), r2=223(x2), r3=246(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 42
LDI r2, 223
LDI r3, 246
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
