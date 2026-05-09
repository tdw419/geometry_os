; DESCRIPTION: Places a magenta 93x66 rectangle at position (257, 146).
; PLAN: r0=257(x), r1=146(y), r2=93(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 146
LDI r2, 93
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
