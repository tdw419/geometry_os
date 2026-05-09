; DESCRIPTION: Creates a magenta rectangular region at (46, 22) spanning 73 by 67 pixels.
; PLAN: r0=46(x), r1=22(y), r2=73(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 22
LDI r2, 73
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
