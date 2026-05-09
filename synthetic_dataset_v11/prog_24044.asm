; DESCRIPTION: Composite: . Then Sets a single black pixel at (150, 76). Then Creates a purple rectangular region at (54, 81) spanning 80 by 73 pixels.
; PLAN: r0=150(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=54(x), r1=81(y), r2=80(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single black pixel at (150, 76).
; PLAN: r0=150(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a purple rectangular region at (54, 81) spanning 80 by 73 pixels.
; PLAN: r0=54(x), r1=81(y), r2=80(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 81
LDI r2, 80
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
