; DESCRIPTION: Places a magenta 34x75 rectangle at position (191, 104).
; PLAN: r0=191(x), r1=104(y), r2=34(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 104
LDI r2, 34
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
