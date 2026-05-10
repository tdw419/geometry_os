; DESCRIPTION: Creates a blue rectangular region at (32, 151) spanning 109 by 43 pixels.
; PLAN: r0=32(x), r1=151(y), r2=109(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 151
LDI r2, 109
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
