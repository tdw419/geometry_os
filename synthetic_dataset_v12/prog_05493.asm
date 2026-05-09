; DESCRIPTION: Creates a blue rectangular region at (116, 68) spanning 29 by 36 pixels.
; PLAN: r0=116(x), r1=68(y), r2=29(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 68
LDI r2, 29
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
