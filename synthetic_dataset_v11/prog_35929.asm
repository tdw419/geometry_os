; DESCRIPTION: Places a white 48x69 rectangle at position (83, 104).
; PLAN: r0=83(x), r1=104(y), r2=48(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 104
LDI r2, 48
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
