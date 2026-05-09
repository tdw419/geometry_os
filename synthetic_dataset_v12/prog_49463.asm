; DESCRIPTION: Creates a red rectangular region at (243, 108) spanning 118 by 69 pixels.
; PLAN: r0=243(x), r1=108(y), r2=118(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 108
LDI r2, 118
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
