; DESCRIPTION: Places a magenta 104x120 rectangle at position (35, 9).
; PLAN: r0=35(x), r1=9(y), r2=104(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 9
LDI r2, 104
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
