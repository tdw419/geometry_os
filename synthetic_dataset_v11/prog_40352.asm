; DESCRIPTION: Places a magenta 52x24 rectangle at position (64, 134).
; PLAN: r0=64(x), r1=134(y), r2=52(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 134
LDI r2, 52
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
