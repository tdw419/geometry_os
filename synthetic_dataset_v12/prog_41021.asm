; DESCRIPTION: Creates a magenta rectangular region at (116, 63) spanning 67 by 73 pixels.
; PLAN: r0=116(x), r1=63(y), r2=67(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 63
LDI r2, 67
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
