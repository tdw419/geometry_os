; DESCRIPTION: Creates a magenta rectangular region at (103, 45) spanning 49 by 38 pixels.
; PLAN: r0=103(x), r1=45(y), r2=49(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 45
LDI r2, 49
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
