; DESCRIPTION: Composite: . Then Sets a single white pixel at (73, 71). Then Renders a purple box of size 59x23 starting at (150, 213).
; PLAN: r0=73(x), r1=71(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=150(x), r1=213(y), r2=59(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (73, 71).
; PLAN: r0=73(x), r1=71(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 73
LDI r1, 71
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 59x23 starting at (150, 213).
; PLAN: r0=150(x), r1=213(y), r2=59(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 213
LDI r2, 59
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
