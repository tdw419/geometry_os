; DESCRIPTION: Creates a magenta rectangular region at (276, 213) spanning 64 by 16 pixels.
; PLAN: r0=276(x), r1=213(y), r2=64(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 213
LDI r2, 64
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
