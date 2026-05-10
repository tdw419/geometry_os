; DESCRIPTION: Creates a black rectangular region at (158, 197) spanning 103 by 35 pixels.
; PLAN: r0=158(x), r1=197(y), r2=103(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 197
LDI r2, 103
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
