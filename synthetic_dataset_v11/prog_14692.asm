; DESCRIPTION: Composite: . Then Renders a cyan box of size 30x47 starting at (199, 7). Then Sets a single black pixel at (169, 45).
; PLAN: r0=199(x), r1=7(y), r2=30(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=169(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a cyan box of size 30x47 starting at (199, 7).
; PLAN: r0=199(x), r1=7(y), r2=30(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 7
LDI r2, 30
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (169, 45).
; PLAN: r0=169(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 169
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
HALT
