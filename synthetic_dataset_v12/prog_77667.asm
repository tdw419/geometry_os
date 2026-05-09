; DESCRIPTION: Creates a black rectangular region at (150, 108) spanning 111 by 96 pixels.
; PLAN: r0=150(x), r1=108(y), r2=111(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 108
LDI r2, 111
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
