; DESCRIPTION: Creates a blue rectangular region at (69, 6) spanning 18 by 75 pixels.
; PLAN: r0=69(x), r1=6(y), r2=18(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 6
LDI r2, 18
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
