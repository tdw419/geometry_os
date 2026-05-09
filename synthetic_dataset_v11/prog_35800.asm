; DESCRIPTION: Composite: . Then Sets a single white pixel at (160, 250). Then Creates a blue rectangular region at (54, 31) spanning 10 by 84 pixels.
; PLAN: r0=160(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=54(x), r1=31(y), r2=10(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (160, 250).
; PLAN: r0=160(x), r1=250(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 250
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Creates a blue rectangular region at (54, 31) spanning 10 by 84 pixels.
; PLAN: r0=54(x), r1=31(y), r2=10(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 31
LDI r2, 10
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
