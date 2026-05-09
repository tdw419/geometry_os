; DESCRIPTION: Places a magenta 82x71 rectangle at position (334, 104).
; PLAN: r0=334(x), r1=104(y), r2=82(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 104
LDI r2, 82
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
