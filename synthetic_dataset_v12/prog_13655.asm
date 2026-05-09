; DESCRIPTION: Creates a magenta rectangular region at (375, 113) spanning 117 by 77 pixels.
; PLAN: r0=375(x), r1=113(y), r2=117(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 113
LDI r2, 117
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
