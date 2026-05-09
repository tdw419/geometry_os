; DESCRIPTION: Composite: . Then Sets a single black pixel at (20, 60). Then Renders a green box of size 57x106 starting at (122, 14).
; PLAN: r0=20(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=122(x), r1=14(y), r2=57(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (20, 60).
; PLAN: r0=20(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 20
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 57x106 starting at (122, 14).
; PLAN: r0=122(x), r1=14(y), r2=57(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 14
LDI r2, 57
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
