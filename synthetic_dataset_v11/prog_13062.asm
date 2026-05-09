; DESCRIPTION: Composite: . Then Places a yellow 89x24 rectangle at position (63, 156). Then Sets a single purple pixel at (160, 105).
; PLAN: r0=63(x), r1=156(y), r2=89(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=160(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 89x24 rectangle at position (63, 156).
; PLAN: r0=63(x), r1=156(y), r2=89(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 156
LDI r2, 89
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (160, 105).
; PLAN: r0=160(x), r1=105(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 105
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
