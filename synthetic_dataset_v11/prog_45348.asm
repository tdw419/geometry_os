; DESCRIPTION: Places a black 108x116 rectangle at position (99, 102).
; PLAN: r0=99(x), r1=102(y), r2=108(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 102
LDI r2, 108
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
