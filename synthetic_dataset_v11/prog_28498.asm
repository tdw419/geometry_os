; DESCRIPTION: Creates a magenta rectangular region at (113, 5) spanning 33 by 75 pixels.
; PLAN: r0=113(x), r1=5(y), r2=33(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 5
LDI r2, 33
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
