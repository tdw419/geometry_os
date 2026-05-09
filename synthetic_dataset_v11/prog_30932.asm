; DESCRIPTION: Creates a blue rectangular region at (209, 116) spanning 24 by 47 pixels.
; PLAN: r0=209(x), r1=116(y), r2=24(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 116
LDI r2, 24
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
