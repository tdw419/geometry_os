; DESCRIPTION: Places a white 19x70 rectangle at position (174, 69).
; PLAN: r0=174(x), r1=69(y), r2=19(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 69
LDI r2, 19
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
