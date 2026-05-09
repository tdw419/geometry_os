; DESCRIPTION: Composite: . Then Draws a white line from (32, 81) to (234, 246). Then Draws a orange circle centered at (153, 83) with radius 47.
; PLAN: r0=32(x1), r1=81(y1), r2=234(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=153(x), r1=83(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (32, 81) to (234, 246).
; PLAN: r0=32(x1), r1=81(y1), r2=234(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 81
LDI r2, 234
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (153, 83) with radius 47.
; PLAN: r0=153(x), r1=83(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 83
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
