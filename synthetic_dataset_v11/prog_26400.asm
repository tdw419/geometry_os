; DESCRIPTION: Places a magenta 16x115 rectangle at position (63, 117).
; PLAN: r0=63(x), r1=117(y), r2=16(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 117
LDI r2, 16
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
