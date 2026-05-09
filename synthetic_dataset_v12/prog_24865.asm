; DESCRIPTION: Creates a magenta rectangular region at (37, 46) spanning 67 by 120 pixels.
; PLAN: r0=37(x), r1=46(y), r2=67(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 46
LDI r2, 67
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
