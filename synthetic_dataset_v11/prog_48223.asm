; DESCRIPTION: Composite: . Then Draws a white circle centered at (131, 77) with radius 68. Then Renders a blue line between points (1, 197) and (224, 171).
; PLAN: r0=131(x), r1=77(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=1(x1), r1=197(y1), r2=224(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (131, 77) with radius 68.
; PLAN: r0=131(x), r1=77(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 77
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a blue line between points (1, 197) and (224, 171).
; PLAN: r0=1(x1), r1=197(y1), r2=224(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 197
LDI r2, 224
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
