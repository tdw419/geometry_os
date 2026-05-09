; DESCRIPTION: Places a blue 104x38 rectangle at position (49, 70).
; PLAN: r0=49(x), r1=70(y), r2=104(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 70
LDI r2, 104
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
