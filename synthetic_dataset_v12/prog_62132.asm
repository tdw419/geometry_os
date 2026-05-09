; DESCRIPTION: Creates a magenta rectangular region at (335, 98) spanning 32 by 67 pixels.
; PLAN: r0=335(x), r1=98(y), r2=32(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 98
LDI r2, 32
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
