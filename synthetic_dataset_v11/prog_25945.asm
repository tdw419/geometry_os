; DESCRIPTION: Composite: . Then Sets a single blue pixel at (175, 9). Then Renders a white box of size 90x34 starting at (79, 47).
; PLAN: r0=175(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=79(x), r1=47(y), r2=90(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (175, 9).
; PLAN: r0=175(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 90x34 starting at (79, 47).
; PLAN: r0=79(x), r1=47(y), r2=90(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 47
LDI r2, 90
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
