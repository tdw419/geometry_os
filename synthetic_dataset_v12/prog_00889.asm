; DESCRIPTION: Creates a magenta rectangular region at (365, 182) spanning 56 by 67 pixels.
; PLAN: r0=365(x), r1=182(y), r2=56(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 182
LDI r2, 56
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
