; DESCRIPTION: Creates a purple rectangular region at (326, 69) spanning 70 by 94 pixels.
; PLAN: r0=326(x), r1=69(y), r2=70(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 69
LDI r2, 70
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
