; DESCRIPTION: Creates a red rectangular region at (71, 25) spanning 11 by 69 pixels.
; PLAN: r0=71(x), r1=25(y), r2=11(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 25
LDI r2, 11
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
