; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (88, 94) spanning 36 by 92 pixels. Then Sets a single green pixel at (45, 153).
; PLAN: r0=88(x), r1=94(y), r2=36(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=45(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a blue rectangular region at (88, 94) spanning 36 by 92 pixels.
; PLAN: r0=88(x), r1=94(y), r2=36(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 94
LDI r2, 36
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (45, 153).
; PLAN: r0=45(x), r1=153(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 153
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
