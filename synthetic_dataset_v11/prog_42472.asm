; DESCRIPTION: Composite: . Then Places a blue 63x39 rectangle at position (131, 206). Then Sets a single magenta pixel at (0, 175).
; PLAN: r0=131(x), r1=206(y), r2=63(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=0(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 63x39 rectangle at position (131, 206).
; PLAN: r0=131(x), r1=206(y), r2=63(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 206
LDI r2, 63
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single magenta pixel at (0, 175).
; PLAN: r0=0(x), r1=175(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 0
LDI r1, 175
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
