; DESCRIPTION: Composite: . Then Sets a single green pixel at (112, 125). Then Renders a white box of size 90x70 starting at (131, 97).
; PLAN: r0=112(x), r1=125(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=131(x), r1=97(y), r2=90(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (112, 125).
; PLAN: r0=112(x), r1=125(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 125
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 90x70 starting at (131, 97).
; PLAN: r0=131(x), r1=97(y), r2=90(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 97
LDI r2, 90
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
