; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (108, 17). Then Renders a purple box of size 92x21 starting at (108, 163).
; PLAN: r0=108(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=108(x), r1=163(y), r2=92(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (108, 17).
; PLAN: r0=108(x), r1=17(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 108
LDI r1, 17
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 92x21 starting at (108, 163).
; PLAN: r0=108(x), r1=163(y), r2=92(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 163
LDI r2, 92
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
