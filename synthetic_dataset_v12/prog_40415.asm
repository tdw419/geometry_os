; DESCRIPTION: Places a red 104x15 rectangle at position (134, 194).
; PLAN: r0=134(x), r1=194(y), r2=104(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 194
LDI r2, 104
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
