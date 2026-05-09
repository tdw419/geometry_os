; DESCRIPTION: Places a black 14x106 rectangle at position (127, 121).
; PLAN: r0=127(x), r1=121(y), r2=14(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 121
LDI r2, 14
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
