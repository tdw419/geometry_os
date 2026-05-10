; DESCRIPTION: Creates a purple rectangular region at (354, 108) spanning 69 by 63 pixels.
; PLAN: r0=354(x), r1=108(y), r2=69(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 108
LDI r2, 69
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
