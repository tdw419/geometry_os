; DESCRIPTION: Places a yellow line segment connecting (267, 161) to (267, 113).
; PLAN: r0=267(x1), r1=161(y1), r2=267(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 161
LDI r2, 267
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
