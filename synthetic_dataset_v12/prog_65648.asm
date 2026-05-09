; DESCRIPTION: Places a magenta 104x50 rectangle at position (267, 73).
; PLAN: r0=267(x), r1=73(y), r2=104(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 73
LDI r2, 104
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
