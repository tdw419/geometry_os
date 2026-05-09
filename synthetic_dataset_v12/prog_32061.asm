; DESCRIPTION: Creates a magenta rectangular region at (298, 29) spanning 114 by 67 pixels.
; PLAN: r0=298(x), r1=29(y), r2=114(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 29
LDI r2, 114
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
