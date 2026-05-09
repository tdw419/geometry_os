; DESCRIPTION: Creates a magenta rectangular region at (129, 67) spanning 85 by 82 pixels.
; PLAN: r0=129(x), r1=67(y), r2=85(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 67
LDI r2, 85
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
