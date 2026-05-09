; DESCRIPTION: Creates a purple rectangular region at (239, 4) spanning 24 by 111 pixels.
; PLAN: r0=239(x), r1=4(y), r2=24(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 4
LDI r2, 24
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
