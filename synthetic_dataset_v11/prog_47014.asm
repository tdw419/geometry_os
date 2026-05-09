; DESCRIPTION: Creates a magenta rectangular region at (111, 143) spanning 78 by 50 pixels.
; PLAN: r0=111(x), r1=143(y), r2=78(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 143
LDI r2, 78
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
