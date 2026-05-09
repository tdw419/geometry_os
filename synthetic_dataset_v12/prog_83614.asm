; DESCRIPTION: Places a green 35x114 rectangle at position (17, 78).
; PLAN: r0=17(x), r1=78(y), r2=35(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 78
LDI r2, 35
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
