; DESCRIPTION: Composite: . Then Renders a magenta line between points (77, 41) and (232, 12). Then Creates a white circular shape at (96, 124) with radius 14.
; PLAN: r0=77(x1), r1=41(y1), r2=232(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=124(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (77, 41) and (232, 12).
; PLAN: r0=77(x1), r1=41(y1), r2=232(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 41
LDI r2, 232
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (96, 124) with radius 14.
; PLAN: r0=96(x), r1=124(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 124
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
