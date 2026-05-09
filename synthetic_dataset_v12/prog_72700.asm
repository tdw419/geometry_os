; DESCRIPTION: Places a green 104x37 rectangle at position (261, 114).
; PLAN: r0=261(x), r1=114(y), r2=104(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 114
LDI r2, 104
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
