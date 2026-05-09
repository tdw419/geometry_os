; DESCRIPTION: Creates a magenta rectangular region at (92, 113) spanning 13 by 21 pixels.
; PLAN: r0=92(x), r1=113(y), r2=13(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 113
LDI r2, 13
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
