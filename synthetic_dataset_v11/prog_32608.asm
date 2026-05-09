; DESCRIPTION: Places a white line segment connecting (127, 134) to (159, 186).
; PLAN: r0=127(x1), r1=134(y1), r2=159(x2), r3=186(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 134
LDI r2, 159
LDI r3, 186
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
