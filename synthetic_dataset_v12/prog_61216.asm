; DESCRIPTION: Creates a magenta rectangular region at (378, 49) spanning 40 by 42 pixels.
; PLAN: r0=378(x), r1=49(y), r2=40(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 49
LDI r2, 40
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
