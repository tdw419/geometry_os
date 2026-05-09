; DESCRIPTION: Composite: . Then Places a green dot at position (104, 136). Then Draws a green circle centered at (50, 189) with radius 35.
; PLAN: r0=104(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=50(x), r1=189(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (104, 136).
; PLAN: r0=104(x), r1=136(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 136
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a green circle centered at (50, 189) with radius 35.
; PLAN: r0=50(x), r1=189(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 189
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
