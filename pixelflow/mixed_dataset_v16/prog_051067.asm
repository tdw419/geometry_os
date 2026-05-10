; DESCRIPTION: Creates a magenta rectangular region at (82, 182) spanning 31 by 49 pixels.
; PLAN: r0=82(x), r1=182(y), r2=31(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 182
LDI r2, 31
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
