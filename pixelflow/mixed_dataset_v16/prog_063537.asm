; DESCRIPTION: Places a magenta 60x115 rectangle at position (429, 37).
; PLAN: r0=429(x), r1=37(y), r2=60(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 37
LDI r2, 60
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
