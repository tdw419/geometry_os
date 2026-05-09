; DESCRIPTION: Composite: . Then Sets a single black pixel at (172, 47). Then Renders a purple box of size 96x113 starting at (83, 50).
; PLAN: r0=172(x), r1=47(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=83(x), r1=50(y), r2=96(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (172, 47).
; PLAN: r0=172(x), r1=47(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 47
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 96x113 starting at (83, 50).
; PLAN: r0=83(x), r1=50(y), r2=96(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 50
LDI r2, 96
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
