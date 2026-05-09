; DESCRIPTION: Places a blue 91x58 rectangle at position (73, 104).
; PLAN: r0=73(x), r1=104(y), r2=91(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 104
LDI r2, 91
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
