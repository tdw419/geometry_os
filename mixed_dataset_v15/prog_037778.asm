; DESCRIPTION: Places a black 96x43 rectangle at position (337, 98).
; PLAN: r0=337(x), r1=98(y), r2=96(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 98
LDI r2, 96
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
