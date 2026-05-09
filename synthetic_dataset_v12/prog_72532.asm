; DESCRIPTION: Places a white 69x39 rectangle at position (3, 11).
; PLAN: r0=3(x), r1=11(y), r2=69(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 11
LDI r2, 69
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
