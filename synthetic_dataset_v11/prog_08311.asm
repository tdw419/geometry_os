; DESCRIPTION: Places a black 108x90 rectangle at position (102, 155).
; PLAN: r0=102(x), r1=155(y), r2=108(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 155
LDI r2, 108
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
