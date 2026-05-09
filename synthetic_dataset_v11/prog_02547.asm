; DESCRIPTION: Composite: . Then Places a purple dot at position (146, 1). Then Draws a orange circle centered at (92, 136) with radius 12.
; PLAN: r0=146(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=92(x), r1=136(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (146, 1).
; PLAN: r0=146(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (92, 136) with radius 12.
; PLAN: r0=92(x), r1=136(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 136
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
