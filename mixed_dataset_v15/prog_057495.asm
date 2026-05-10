; DESCRIPTION: Places a white 69x104 rectangle at position (397, 94).
; PLAN: r0=397(x), r1=94(y), r2=69(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 94
LDI r2, 69
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
