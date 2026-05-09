; DESCRIPTION: Places a white line segment connecting (276, 28) to (267, 135).
; PLAN: r0=276(x1), r1=28(y1), r2=267(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 28
LDI r2, 267
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
