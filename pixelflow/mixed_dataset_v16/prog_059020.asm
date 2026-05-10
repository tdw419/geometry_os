; DESCRIPTION: Creates a blue rectangular region at (320, 138) spanning 102 by 113 pixels.
; PLAN: r0=320(x), r1=138(y), r2=102(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 138
LDI r2, 102
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
