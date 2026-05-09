; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (108, 208). Then Draws a red circle centered at (182, 203) with radius 39.
; PLAN: r0=108(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=182(x), r1=203(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (108, 208).
; PLAN: r0=108(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 208
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a red circle centered at (182, 203) with radius 39.
; PLAN: r0=182(x), r1=203(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 203
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
