; DESCRIPTION: Creates a red rectangular region at (36, 82) spanning 69 by 96 pixels.
; PLAN: r0=36(x), r1=82(y), r2=69(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 82
LDI r2, 69
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
