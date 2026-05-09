; DESCRIPTION: Composite: . Then Places a purple dot at position (209, 20). Then Draws a green circle centered at (92, 121) with radius 42.
; PLAN: r0=209(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=92(x), r1=121(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (209, 20).
; PLAN: r0=209(x), r1=20(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 20
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green circle centered at (92, 121) with radius 42.
; PLAN: r0=92(x), r1=121(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 121
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
