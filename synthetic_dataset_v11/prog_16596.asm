; DESCRIPTION: Composite: . Then Renders a white line between points (109, 131) and (14, 74). Then Creates a black circular shape at (206, 68) with radius 24.
; PLAN: r0=109(x1), r1=131(y1), r2=14(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=206(x), r1=68(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (109, 131) and (14, 74).
; PLAN: r0=109(x1), r1=131(y1), r2=14(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 131
LDI r2, 14
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (206, 68) with radius 24.
; PLAN: r0=206(x), r1=68(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 68
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
