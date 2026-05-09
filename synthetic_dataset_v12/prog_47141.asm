; DESCRIPTION: Creates a magenta rectangular region at (378, 107) spanning 12 by 47 pixels.
; PLAN: r0=378(x), r1=107(y), r2=12(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 107
LDI r2, 12
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
