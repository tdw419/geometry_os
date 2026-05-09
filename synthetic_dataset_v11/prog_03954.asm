; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (113, 202). Then Creates a purple rectangular region at (33, 45) spanning 50 by 114 pixels.
; PLAN: r0=113(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=33(x), r1=45(y), r2=50(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (113, 202).
; PLAN: r0=113(x), r1=202(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 113
LDI r1, 202
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (33, 45) spanning 50 by 114 pixels.
; PLAN: r0=33(x), r1=45(y), r2=50(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 45
LDI r2, 50
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
