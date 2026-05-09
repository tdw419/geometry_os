; DESCRIPTION: Composite: . Then Creates a blue circular shape at (214, 196) with radius 14. Then Renders a blue line between points (255, 146) and (166, 214).
; PLAN: r0=214(x), r1=196(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=255(x1), r1=146(y1), r2=166(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (214, 196) with radius 14.
; PLAN: r0=214(x), r1=196(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 196
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (255, 146) and (166, 214).
; PLAN: r0=255(x1), r1=146(y1), r2=166(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 146
LDI r2, 166
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
