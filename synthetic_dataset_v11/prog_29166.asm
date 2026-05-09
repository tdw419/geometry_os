; DESCRIPTION: Places a blue 104x64 rectangle at position (5, 58).
; PLAN: r0=5(x), r1=58(y), r2=104(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 58
LDI r2, 104
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
