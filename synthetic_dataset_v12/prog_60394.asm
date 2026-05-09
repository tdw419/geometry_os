; DESCRIPTION: Places a blue 104x75 rectangle at position (31, 144).
; PLAN: r0=31(x), r1=144(y), r2=104(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 144
LDI r2, 104
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
