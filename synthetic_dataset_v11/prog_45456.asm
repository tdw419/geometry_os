; DESCRIPTION: Places a magenta 104x74 rectangle at position (41, 117).
; PLAN: r0=41(x), r1=117(y), r2=104(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 117
LDI r2, 104
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
