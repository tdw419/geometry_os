; DESCRIPTION: Creates a blue rectangular region at (320, 96) spanning 68 by 116 pixels.
; PLAN: r0=320(x), r1=96(y), r2=68(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 96
LDI r2, 68
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
