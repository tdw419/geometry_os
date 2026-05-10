; DESCRIPTION: Creates a red rectangular region at (119, 150) spanning 69 by 94 pixels.
; PLAN: r0=119(x), r1=150(y), r2=69(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 150
LDI r2, 69
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
