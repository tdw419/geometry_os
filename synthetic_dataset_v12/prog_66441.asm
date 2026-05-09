; DESCRIPTION: Creates a blue rectangular region at (268, 154) spanning 114 by 10 pixels.
; PLAN: r0=268(x), r1=154(y), r2=114(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 154
LDI r2, 114
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
