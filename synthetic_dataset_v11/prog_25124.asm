; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (99, 124) spanning 29 by 112 pixels. Then Sets a single yellow pixel at (153, 185).
; PLAN: r0=99(x), r1=124(y), r2=29(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=153(x), r1=185(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (99, 124) spanning 29 by 112 pixels.
; PLAN: r0=99(x), r1=124(y), r2=29(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 124
LDI r2, 29
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (153, 185).
; PLAN: r0=153(x), r1=185(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 185
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
