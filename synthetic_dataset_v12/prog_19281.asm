; DESCRIPTION: Creates a magenta rectangular region at (288, 131) spanning 40 by 82 pixels.
; PLAN: r0=288(x), r1=131(y), r2=40(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 131
LDI r2, 40
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
