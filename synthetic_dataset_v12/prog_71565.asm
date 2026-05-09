; DESCRIPTION: Creates a magenta rectangular region at (74, 2) spanning 86 by 17 pixels.
; PLAN: r0=74(x), r1=2(y), r2=86(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 2
LDI r2, 86
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
