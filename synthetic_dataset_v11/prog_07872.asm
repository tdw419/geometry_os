; DESCRIPTION: Places a white 37x56 rectangle at position (65, 104).
; PLAN: r0=65(x), r1=104(y), r2=37(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 104
LDI r2, 37
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
