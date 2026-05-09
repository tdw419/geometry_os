; DESCRIPTION: Creates a purple rectangular region at (171, 65) spanning 54 by 69 pixels.
; PLAN: r0=171(x), r1=65(y), r2=54(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 65
LDI r2, 54
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
