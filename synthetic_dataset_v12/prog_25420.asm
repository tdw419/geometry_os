; DESCRIPTION: Places a white 26x66 rectangle at position (108, 125).
; PLAN: r0=108(x), r1=125(y), r2=26(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 125
LDI r2, 26
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
