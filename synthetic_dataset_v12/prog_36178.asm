; DESCRIPTION: Places a blue 104x105 rectangle at position (317, 62).
; PLAN: r0=317(x), r1=62(y), r2=104(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 62
LDI r2, 104
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
