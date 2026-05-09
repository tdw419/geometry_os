; DESCRIPTION: Draws a green line from (220, 166) to (127, 47).
; PLAN: r0=220(x1), r1=166(y1), r2=127(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 166
LDI r2, 127
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
