; DESCRIPTION: Creates a magenta rectangular region at (64, 91) spanning 113 by 37 pixels.
; PLAN: r0=64(x), r1=91(y), r2=113(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 91
LDI r2, 113
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
