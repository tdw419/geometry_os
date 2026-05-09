; DESCRIPTION: Draws a green line from (61, 199) to (127, 148).
; PLAN: r0=61(x1), r1=199(y1), r2=127(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 199
LDI r2, 127
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
