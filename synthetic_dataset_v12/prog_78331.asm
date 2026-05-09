; DESCRIPTION: Creates a magenta rectangular region at (445, 119) spanning 26 by 67 pixels.
; PLAN: r0=445(x), r1=119(y), r2=26(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 119
LDI r2, 26
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
