; DESCRIPTION: Places a blue 104x117 rectangle at position (71, 85).
; PLAN: r0=71(x), r1=85(y), r2=104(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 85
LDI r2, 104
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
