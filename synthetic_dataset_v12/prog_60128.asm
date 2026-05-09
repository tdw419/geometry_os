; DESCRIPTION: Places a green 104x58 rectangle at position (370, 178).
; PLAN: r0=370(x), r1=178(y), r2=104(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 178
LDI r2, 104
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
