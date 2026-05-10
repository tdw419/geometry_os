; DESCRIPTION: Places a white 17x78 box at position (227, 59).
; PLAN: r0=227(x), r1=59(y), r2=17(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 59
LDI r2, 17
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
