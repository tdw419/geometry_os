; DESCRIPTION: Creates a blue rectangular region at (217, 154) spanning 29 by 10 pixels.
; PLAN: r0=217(x), r1=154(y), r2=29(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 154
LDI r2, 29
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
