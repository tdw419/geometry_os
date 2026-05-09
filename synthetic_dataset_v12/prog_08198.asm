; DESCRIPTION: Places a white 30x63 rectangle at position (267, 56).
; PLAN: r0=267(x), r1=56(y), r2=30(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 56
LDI r2, 30
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
