; DESCRIPTION: Creates a magenta rectangular region at (228, 166) spanning 64 by 66 pixels.
; PLAN: r0=228(x), r1=166(y), r2=64(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 166
LDI r2, 64
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
