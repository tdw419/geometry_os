; DESCRIPTION: Creates a black rectangular region at (121, 13) spanning 93 by 111 pixels.
; PLAN: r0=121(x), r1=13(y), r2=93(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 13
LDI r2, 93
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
