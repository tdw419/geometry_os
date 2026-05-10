; DESCRIPTION: Creates a magenta rectangular region at (266, 111) spanning 16 by 15 pixels.
; PLAN: r0=266(x), r1=111(y), r2=16(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 111
LDI r2, 16
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
