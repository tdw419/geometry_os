; DESCRIPTION: Creates a magenta rectangular region at (57, 113) spanning 58 by 59 pixels.
; PLAN: r0=57(x), r1=113(y), r2=58(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 113
LDI r2, 58
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
