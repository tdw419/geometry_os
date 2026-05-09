; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (20, 1) spanning 67 by 84 pixels. Then Sets a single black pixel at (8, 228).
; PLAN: r0=20(x), r1=1(y), r2=67(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=8(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta rectangular region at (20, 1) spanning 67 by 84 pixels.
; PLAN: r0=20(x), r1=1(y), r2=67(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 1
LDI r2, 67
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (8, 228).
; PLAN: r0=8(x), r1=228(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 228
LDI r2, 0x000000
PSET r0, r1, r2
HALT
