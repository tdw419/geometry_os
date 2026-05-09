; DESCRIPTION: Composite: . Then Sets a single green pixel at (192, 158). Then Creates a blue rectangular region at (132, 24) spanning 107 by 30 pixels.
; PLAN: r0=192(x), r1=158(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=132(x), r1=24(y), r2=107(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (192, 158).
; PLAN: r0=192(x), r1=158(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 158
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (132, 24) spanning 107 by 30 pixels.
; PLAN: r0=132(x), r1=24(y), r2=107(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 24
LDI r2, 107
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
