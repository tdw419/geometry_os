; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (98, 162) with radius 49. Then Places a yellow dot at position (16, 59).
; PLAN: r0=98(x), r1=162(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=16(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a magenta circle centered at (98, 162) with radius 49.
; PLAN: r0=98(x), r1=162(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 162
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (16, 59).
; PLAN: r0=16(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
