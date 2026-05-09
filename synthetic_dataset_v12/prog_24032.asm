; DESCRIPTION: Creates a magenta rectangular region at (228, 198) spanning 60 by 18 pixels.
; PLAN: r0=228(x), r1=198(y), r2=60(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 198
LDI r2, 60
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
