; DESCRIPTION: Places a magenta 70x115 rectangle at position (379, 86).
; PLAN: r0=379(x), r1=86(y), r2=70(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 86
LDI r2, 70
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
