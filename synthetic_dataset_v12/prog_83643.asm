; DESCRIPTION: Composite: Places a green dot at position (500, 238) then Draws a white circle centered at (359, 67) with radius 50.
; PLAN: r0=500(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=67(y), r7=50(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 500
LDI r1, 238
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 359
LDI r6, 67
LDI r7, 50
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
