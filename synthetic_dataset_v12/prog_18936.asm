; DESCRIPTION: Creates a magenta rectangular region at (228, 9) spanning 102 by 63 pixels.
; PLAN: r0=228(x), r1=9(y), r2=102(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 9
LDI r2, 102
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
