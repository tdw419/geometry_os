; DESCRIPTION: Creates a magenta rectangular region at (291, 0) spanning 111 by 58 pixels.
; PLAN: r0=291(x), r1=0(y), r2=111(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 0
LDI r2, 111
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
