; DESCRIPTION: Places a black 98x35 rectangle at position (121, 12).
; PLAN: r0=121(x), r1=12(y), r2=98(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 12
LDI r2, 98
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
