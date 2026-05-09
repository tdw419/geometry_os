; DESCRIPTION: Places a red line segment connecting (111, 171) to (396, 183).
; PLAN: r0=111(x1), r1=171(y1), r2=396(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 171
LDI r2, 396
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
