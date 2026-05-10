; DESCRIPTION: Places a magenta 82x42 rectangle at position (40, 149).
; PLAN: r0=40(x), r1=149(y), r2=82(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 149
LDI r2, 82
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
