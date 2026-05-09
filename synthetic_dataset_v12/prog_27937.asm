; DESCRIPTION: Creates a black rectangular region at (209, 20) spanning 111 by 49 pixels.
; PLAN: r0=209(x), r1=20(y), r2=111(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 20
LDI r2, 111
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
