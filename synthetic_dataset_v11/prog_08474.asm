; DESCRIPTION: Creates a red rectangular region at (148, 194) spanning 88 by 11 pixels.
; PLAN: r0=148(x), r1=194(y), r2=88(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 194
LDI r2, 88
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
