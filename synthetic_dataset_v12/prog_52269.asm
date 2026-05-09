; DESCRIPTION: Places a red 66x80 rectangle at position (267, 116).
; PLAN: r0=267(x), r1=116(y), r2=66(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 116
LDI r2, 66
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
