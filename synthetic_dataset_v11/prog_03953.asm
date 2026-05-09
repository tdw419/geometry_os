; DESCRIPTION: Creates a blue rectangular region at (190, 7) spanning 13 by 69 pixels.
; PLAN: r0=190(x), r1=7(y), r2=13(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 7
LDI r2, 13
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
