; DESCRIPTION: Places a white 17x17 rectangle at position (149, 6).
; PLAN: r0=149(x), r1=6(y), r2=17(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 6
LDI r2, 17
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
