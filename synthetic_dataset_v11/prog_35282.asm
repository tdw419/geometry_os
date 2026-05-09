; DESCRIPTION: Composite: . Then Sets a single orange pixel at (21, 212). Then Places a purple 119x27 rectangle at position (52, 108).
; PLAN: r0=21(x), r1=212(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=52(x), r1=108(y), r2=119(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (21, 212).
; PLAN: r0=21(x), r1=212(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 21
LDI r1, 212
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a purple 119x27 rectangle at position (52, 108).
; PLAN: r0=52(x), r1=108(y), r2=119(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 108
LDI r2, 119
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
