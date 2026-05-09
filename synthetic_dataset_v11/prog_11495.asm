; DESCRIPTION: Creates a magenta rectangular region at (154, 22) spanning 94 by 112 pixels.
; PLAN: r0=154(x), r1=22(y), r2=94(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 22
LDI r2, 94
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
