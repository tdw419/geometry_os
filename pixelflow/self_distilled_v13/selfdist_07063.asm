; DESCRIPTION: Places a white 71x69 box at position (76, 100).
; PLAN: r0=76(x), r1=100(y), r2=71(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 100
LDI r2, 71
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
