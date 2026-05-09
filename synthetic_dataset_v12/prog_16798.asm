; DESCRIPTION: Draws a blue line from (152, 58) to (267, 8).
; PLAN: r0=152(x1), r1=58(y1), r2=267(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 58
LDI r2, 267
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
