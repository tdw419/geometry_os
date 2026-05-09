; DESCRIPTION: Composite: . Then Sets a single orange pixel at (102, 23). Then Renders a white box of size 18x112 starting at (25, 69).
; PLAN: r0=102(x), r1=23(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=25(x), r1=69(y), r2=18(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (102, 23).
; PLAN: r0=102(x), r1=23(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 23
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 18x112 starting at (25, 69).
; PLAN: r0=25(x), r1=69(y), r2=18(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 69
LDI r2, 18
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
