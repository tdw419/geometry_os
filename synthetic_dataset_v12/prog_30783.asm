; DESCRIPTION: Creates a magenta rectangular region at (265, 192) spanning 103 by 30 pixels.
; PLAN: r0=265(x), r1=192(y), r2=103(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 192
LDI r2, 103
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
