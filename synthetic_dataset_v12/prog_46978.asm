; DESCRIPTION: Creates a blue rectangular region at (130, 17) spanning 120 by 116 pixels.
; PLAN: r0=130(x), r1=17(y), r2=120(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 17
LDI r2, 120
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
