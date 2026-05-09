; DESCRIPTION: Composite: . Then Places a red dot at position (112, 243). Then Draws a yellow circle centered at (192, 139) with radius 35.
; PLAN: r0=112(x), r1=243(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=192(x), r1=139(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (112, 243).
; PLAN: r0=112(x), r1=243(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 243
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow circle centered at (192, 139) with radius 35.
; PLAN: r0=192(x), r1=139(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 139
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
