; DESCRIPTION: Places a black 77x20 rectangle at position (184, 149).
; PLAN: r0=184(x), r1=149(y), r2=77(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 149
LDI r2, 77
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
