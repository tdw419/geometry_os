; DESCRIPTION: Creates a magenta rectangular region at (43, 109) spanning 107 by 67 pixels.
; PLAN: r0=43(x), r1=109(y), r2=107(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 109
LDI r2, 107
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
