; DESCRIPTION: Creates a blue rectangular region at (330, 15) spanning 109 by 81 pixels.
; PLAN: r0=330(x), r1=15(y), r2=109(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 15
LDI r2, 109
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
