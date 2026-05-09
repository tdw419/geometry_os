; DESCRIPTION: Composite: . Then Renders a blue box of size 92x33 starting at (82, 193). Then Draws a purple circle centered at (147, 139) with radius 57.
; PLAN: r0=82(x), r1=193(y), r2=92(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x), r1=139(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a blue box of size 92x33 starting at (82, 193).
; PLAN: r0=82(x), r1=193(y), r2=92(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 193
LDI r2, 92
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple circle centered at (147, 139) with radius 57.
; PLAN: r0=147(x), r1=139(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 139
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
