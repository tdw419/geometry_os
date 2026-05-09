; DESCRIPTION: Places a magenta 104x117 rectangle at position (78, 107).
; PLAN: r0=78(x), r1=107(y), r2=104(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 107
LDI r2, 104
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
