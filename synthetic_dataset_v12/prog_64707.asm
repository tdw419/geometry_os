; DESCRIPTION: Creates a blue rectangular region at (320, 121) spanning 68 by 28 pixels.
; PLAN: r0=320(x), r1=121(y), r2=68(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 121
LDI r2, 68
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
