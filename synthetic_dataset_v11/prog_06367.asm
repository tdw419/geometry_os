; DESCRIPTION: Places a green 76x106 rectangle at position (176, 104).
; PLAN: r0=176(x), r1=104(y), r2=76(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 104
LDI r2, 76
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
