; DESCRIPTION: Creates a blue rectangular region at (165, 129) spanning 66 by 69 pixels.
; PLAN: r0=165(x), r1=129(y), r2=66(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 129
LDI r2, 66
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
