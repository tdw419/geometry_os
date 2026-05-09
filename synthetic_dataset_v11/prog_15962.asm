; DESCRIPTION: Composite: . Then Places a yellow dot at position (193, 40). Then Draws a red circle centered at (165, 95) with radius 33.
; PLAN: r0=193(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=165(x), r1=95(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a yellow dot at position (193, 40).
; PLAN: r0=193(x), r1=40(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 40
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (165, 95) with radius 33.
; PLAN: r0=165(x), r1=95(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 95
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
