; DESCRIPTION: Creates a magenta rectangular region at (104, 18) spanning 29 by 25 pixels.
; PLAN: r0=104(x), r1=18(y), r2=29(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 18
LDI r2, 29
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
