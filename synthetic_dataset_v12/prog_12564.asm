; DESCRIPTION: Creates a yellow rectangular region at (428, 93) spanning 69 by 62 pixels.
; PLAN: r0=428(x), r1=93(y), r2=69(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 93
LDI r2, 69
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
