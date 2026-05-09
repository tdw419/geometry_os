; DESCRIPTION: Creates a red rectangular region at (19, 5) spanning 13 by 105 pixels.
; PLAN: r0=19(x), r1=5(y), r2=13(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 5
LDI r2, 13
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
