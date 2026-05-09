; DESCRIPTION: Creates a magenta rectangular region at (279, 32) spanning 85 by 48 pixels.
; PLAN: r0=279(x), r1=32(y), r2=85(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 32
LDI r2, 85
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
