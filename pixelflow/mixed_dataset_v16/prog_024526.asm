; DESCRIPTION: Creates a magenta rectangular region at (20, 98) spanning 30 by 111 pixels.
; PLAN: r0=20(x), r1=98(y), r2=30(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 98
LDI r2, 30
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
