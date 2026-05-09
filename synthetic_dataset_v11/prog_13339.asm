; DESCRIPTION: Creates a blue rectangular region at (130, 154) spanning 44 by 17 pixels.
; PLAN: r0=130(x), r1=154(y), r2=44(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 154
LDI r2, 44
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
