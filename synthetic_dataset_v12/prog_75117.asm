; DESCRIPTION: Creates a magenta rectangular region at (21, 113) spanning 84 by 65 pixels.
; PLAN: r0=21(x), r1=113(y), r2=84(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 113
LDI r2, 84
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
