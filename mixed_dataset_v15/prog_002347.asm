; DESCRIPTION: Places a black 97x116 rectangle at position (17, 5).
; PLAN: r0=17(x), r1=5(y), r2=97(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 5
LDI r2, 97
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
