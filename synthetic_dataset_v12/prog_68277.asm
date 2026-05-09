; DESCRIPTION: Creates a magenta rectangular region at (194, 195) spanning 94 by 16 pixels.
; PLAN: r0=194(x), r1=195(y), r2=94(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 195
LDI r2, 94
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
