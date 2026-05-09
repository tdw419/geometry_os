; DESCRIPTION: Creates a magenta rectangular region at (76, 153) spanning 82 by 70 pixels.
; PLAN: r0=76(x), r1=153(y), r2=82(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 153
LDI r2, 82
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
