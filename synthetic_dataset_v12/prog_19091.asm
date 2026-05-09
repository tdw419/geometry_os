; DESCRIPTION: Places a white 55x87 rectangle at position (261, 100).
; PLAN: r0=261(x), r1=100(y), r2=55(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 100
LDI r2, 55
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
