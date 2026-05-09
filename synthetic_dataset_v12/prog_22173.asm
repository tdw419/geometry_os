; DESCRIPTION: Places a yellow line segment connecting (267, 111) to (191, 255).
; PLAN: r0=267(x1), r1=111(y1), r2=191(x2), r3=255(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 111
LDI r2, 191
LDI r3, 255
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
