; DESCRIPTION: Draws a green line from (166, 168) to (267, 56).
; PLAN: r0=166(x1), r1=168(y1), r2=267(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 168
LDI r2, 267
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
