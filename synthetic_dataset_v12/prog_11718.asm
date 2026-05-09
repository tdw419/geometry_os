; DESCRIPTION: Places a black 90x43 rectangle at position (127, 121).
; PLAN: r0=127(x), r1=121(y), r2=90(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 121
LDI r2, 90
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
