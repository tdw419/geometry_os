; DESCRIPTION: Composite: . Then Sets a single green pixel at (69, 69). Then Creates a blue rectangular region at (1, 18) spanning 20 by 60 pixels.
; PLAN: r0=69(x), r1=69(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=1(x), r1=18(y), r2=20(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (69, 69).
; PLAN: r0=69(x), r1=69(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 69
LDI r1, 69
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (1, 18) spanning 20 by 60 pixels.
; PLAN: r0=1(x), r1=18(y), r2=20(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 18
LDI r2, 20
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
