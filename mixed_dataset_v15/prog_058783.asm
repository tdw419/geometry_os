; DESCRIPTION: Renders a white line between points (397, 166) and (195, 159).
; PLAN: r0=397(x1), r1=166(y1), r2=195(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 166
LDI r2, 195
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
