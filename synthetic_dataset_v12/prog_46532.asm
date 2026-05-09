; DESCRIPTION: Creates a blue rectangular region at (184, 121) spanning 82 by 43 pixels.
; PLAN: r0=184(x), r1=121(y), r2=82(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 121
LDI r2, 82
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
