; DESCRIPTION: Places a white 103x47 rectangle at position (225, 69).
; PLAN: r0=225(x), r1=69(y), r2=103(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 69
LDI r2, 103
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
