; DESCRIPTION: Creates a magenta rectangular region at (264, 8) spanning 84 by 112 pixels.
; PLAN: r0=264(x), r1=8(y), r2=84(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 8
LDI r2, 84
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
