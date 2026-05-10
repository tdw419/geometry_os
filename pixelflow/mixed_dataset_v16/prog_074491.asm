; DESCRIPTION: Creates a black rectangular region at (412, 151) spanning 91 by 101 pixels.
; PLAN: r0=412(x), r1=151(y), r2=91(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 151
LDI r2, 91
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
