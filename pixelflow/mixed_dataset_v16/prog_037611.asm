; DESCRIPTION: Draws a green line from (194, 151) to (496, 143).
; PLAN: r0=194(x1), r1=151(y1), r2=496(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 151
LDI r2, 496
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
