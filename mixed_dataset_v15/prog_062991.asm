; DESCRIPTION: Renders a yellow line between points (183, 195) and (387, 212).
; PLAN: r0=183(x1), r1=195(y1), r2=387(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 195
LDI r2, 387
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
