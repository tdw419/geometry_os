; DESCRIPTION: Places a green 116x46 rectangle at position (14, 181).
; PLAN: r0=14(x), r1=181(y), r2=116(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 181
LDI r2, 116
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
