; DESCRIPTION: Places a white 23x69 rectangle at position (420, 1).
; PLAN: r0=420(x), r1=1(y), r2=23(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 1
LDI r2, 23
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
