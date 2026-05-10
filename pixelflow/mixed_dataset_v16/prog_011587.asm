; DESCRIPTION: Creates a magenta rectangular region at (257, 177) spanning 32 by 38 pixels.
; PLAN: r0=257(x), r1=177(y), r2=32(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 177
LDI r2, 32
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
