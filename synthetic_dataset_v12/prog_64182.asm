; DESCRIPTION: Draws a green line from (274, 181) to (330, 125).
; PLAN: r0=274(x1), r1=181(y1), r2=330(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 181
LDI r2, 330
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
