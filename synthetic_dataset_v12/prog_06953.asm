; DESCRIPTION: Creates a magenta rectangular region at (139, 29) spanning 28 by 20 pixels.
; PLAN: r0=139(x), r1=29(y), r2=28(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 29
LDI r2, 28
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
