; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (55, 225). Then Renders a yellow box of size 97x60 starting at (23, 121).
; PLAN: r0=55(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=23(x), r1=121(y), r2=97(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (55, 225).
; PLAN: r0=55(x), r1=225(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 55
LDI r1, 225
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 97x60 starting at (23, 121).
; PLAN: r0=23(x), r1=121(y), r2=97(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 121
LDI r2, 97
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
