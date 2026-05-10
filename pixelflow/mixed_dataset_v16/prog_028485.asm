; DESCRIPTION: Creates a magenta rectangular region at (105, 125) spanning 61 by 20 pixels.
; PLAN: r0=105(x), r1=125(y), r2=61(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 125
LDI r2, 61
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
