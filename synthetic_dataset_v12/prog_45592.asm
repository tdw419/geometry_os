; DESCRIPTION: Creates a red rectangular region at (351, 93) spanning 69 by 108 pixels.
; PLAN: r0=351(x), r1=93(y), r2=69(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 93
LDI r2, 69
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
