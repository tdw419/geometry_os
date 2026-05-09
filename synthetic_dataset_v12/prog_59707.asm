; DESCRIPTION: Creates a blue rectangular region at (175, 69) spanning 20 by 105 pixels.
; PLAN: r0=175(x), r1=69(y), r2=20(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 69
LDI r2, 20
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
