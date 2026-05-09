; DESCRIPTION: Places a yellow 100x13 rectangle at position (3, 125).
; PLAN: r0=3(x), r1=125(y), r2=100(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 125
LDI r2, 100
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
