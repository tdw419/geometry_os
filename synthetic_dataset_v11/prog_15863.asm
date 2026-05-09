; DESCRIPTION: Composite: . Then Creates a green rectangular region at (162, 97) spanning 45 by 65 pixels. Then Sets a single black pixel at (105, 134).
; PLAN: r0=162(x), r1=97(y), r2=45(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=105(x), r1=134(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green rectangular region at (162, 97) spanning 45 by 65 pixels.
; PLAN: r0=162(x), r1=97(y), r2=45(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 97
LDI r2, 45
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (105, 134).
; PLAN: r0=105(x), r1=134(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 105
LDI r1, 134
LDI r2, 0x000000
PSET r0, r1, r2
HALT
