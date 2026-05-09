; DESCRIPTION: Creates a magenta rectangular region at (105, 99) spanning 113 by 32 pixels.
; PLAN: r0=105(x), r1=99(y), r2=113(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 99
LDI r2, 113
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
