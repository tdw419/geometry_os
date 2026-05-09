; DESCRIPTION: Composite: . Then Renders a magenta box of size 107x59 starting at (107, 73). Then Sets a single yellow pixel at (10, 51).
; PLAN: r0=107(x), r1=73(y), r2=107(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=10(x), r1=51(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta box of size 107x59 starting at (107, 73).
; PLAN: r0=107(x), r1=73(y), r2=107(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 73
LDI r2, 107
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (10, 51).
; PLAN: r0=10(x), r1=51(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 10
LDI r1, 51
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
