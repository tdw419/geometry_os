; DESCRIPTION: Creates a red rectangular region at (324, 112) spanning 101 by 82 pixels.
; PLAN: r0=324(x), r1=112(y), r2=101(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 112
LDI r2, 101
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
