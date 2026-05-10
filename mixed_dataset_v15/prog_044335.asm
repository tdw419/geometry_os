; DESCRIPTION: Places a magenta 60x24 rectangle at position (184, 51).
; PLAN: r0=184(x), r1=51(y), r2=60(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 51
LDI r2, 60
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
