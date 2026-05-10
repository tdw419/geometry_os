; DESCRIPTION: Places a magenta 93x93 rectangle at position (87, 150).
; PLAN: r0=87(x), r1=150(y), r2=93(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 150
LDI r2, 93
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
