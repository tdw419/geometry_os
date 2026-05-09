; DESCRIPTION: Composite: . Then Places a yellow 79x39 rectangle at position (145, 32). Then Sets a single purple pixel at (17, 80).
; PLAN: r0=145(x), r1=32(y), r2=79(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=17(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow 79x39 rectangle at position (145, 32).
; PLAN: r0=145(x), r1=32(y), r2=79(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 32
LDI r2, 79
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (17, 80).
; PLAN: r0=17(x), r1=80(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 17
LDI r1, 80
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
