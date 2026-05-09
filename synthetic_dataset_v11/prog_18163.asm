; DESCRIPTION: Composite: . Then Places a yellow 63x79 rectangle at position (85, 36). Then Sets a single magenta pixel at (196, 5).
; PLAN: r0=85(x), r1=36(y), r2=63(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=196(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 63x79 rectangle at position (85, 36).
; PLAN: r0=85(x), r1=36(y), r2=63(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 36
LDI r2, 63
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (196, 5).
; PLAN: r0=196(x), r1=5(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 196
LDI r1, 5
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
