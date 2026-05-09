; DESCRIPTION: Creates a magenta rectangular region at (436, 164) spanning 53 by 72 pixels.
; PLAN: r0=436(x), r1=164(y), r2=53(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 164
LDI r2, 53
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
