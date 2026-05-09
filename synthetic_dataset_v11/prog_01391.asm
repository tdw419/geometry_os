; DESCRIPTION: Composite: . Then Sets a single green pixel at (110, 85). Then Renders a white box of size 69x84 starting at (114, 142).
; PLAN: r0=110(x), r1=85(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=114(x), r1=142(y), r2=69(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (110, 85).
; PLAN: r0=110(x), r1=85(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 110
LDI r1, 85
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 69x84 starting at (114, 142).
; PLAN: r0=114(x), r1=142(y), r2=69(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 142
LDI r2, 69
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
