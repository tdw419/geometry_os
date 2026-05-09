; DESCRIPTION: Creates a blue rectangular region at (213, 83) spanning 26 by 92 pixels.
; PLAN: r0=213(x), r1=83(y), r2=26(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 83
LDI r2, 26
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
