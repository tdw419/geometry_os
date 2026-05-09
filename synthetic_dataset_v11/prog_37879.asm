; DESCRIPTION: Creates a yellow rectangular region at (120, 148) spanning 82 by 101 pixels.
; PLAN: r0=120(x), r1=148(y), r2=82(width), r3=101(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 148
LDI r2, 82
LDI r3, 101
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
