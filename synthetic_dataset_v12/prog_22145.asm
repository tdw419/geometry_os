; DESCRIPTION: Creates a purple rectangular region at (197, 184) spanning 69 by 55 pixels.
; PLAN: r0=197(x), r1=184(y), r2=69(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 184
LDI r2, 69
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
