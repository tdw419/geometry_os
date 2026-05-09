; DESCRIPTION: Composite: . Then Places a blue dot at position (18, 110). Then Places a magenta 63x18 rectangle at position (150, 106).
; PLAN: r0=18(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=150(x), r1=106(y), r2=63(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (18, 110).
; PLAN: r0=18(x), r1=110(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 110
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 63x18 rectangle at position (150, 106).
; PLAN: r0=150(x), r1=106(y), r2=63(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 106
LDI r2, 63
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
