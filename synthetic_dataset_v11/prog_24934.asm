; DESCRIPTION: Draws a yellow line from (159, 228) to (125, 153).
; PLAN: r0=159(x1), r1=228(y1), r2=125(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 228
LDI r2, 125
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
