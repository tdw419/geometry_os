; DESCRIPTION: Draws a green circle centered at (197, 111) with radius 42.
; PLAN: r0=197(x), r1=111(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 111
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
