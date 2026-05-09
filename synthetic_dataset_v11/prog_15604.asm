; DESCRIPTION: Creates a purple rectangular region at (69, 103) spanning 23 by 57 pixels.
; PLAN: r0=69(x), r1=103(y), r2=23(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 103
LDI r2, 23
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
