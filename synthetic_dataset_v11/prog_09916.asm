; DESCRIPTION: Places a black 59x46 rectangle at position (78, 3).
; PLAN: r0=78(x), r1=3(y), r2=59(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 3
LDI r2, 59
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
