; DESCRIPTION: Creates a blue rectangular region at (46, 56) spanning 116 by 74 pixels.
; PLAN: r0=46(x), r1=56(y), r2=116(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 56
LDI r2, 116
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
