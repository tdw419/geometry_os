; DESCRIPTION: Places a yellow 72x54 rectangle at position (375, 104).
; PLAN: r0=375(x), r1=104(y), r2=72(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 104
LDI r2, 72
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
