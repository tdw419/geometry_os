; DESCRIPTION: Places a black 91x105 rectangle at position (16, 43).
; PLAN: r0=16(x), r1=43(y), r2=91(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 43
LDI r2, 91
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
