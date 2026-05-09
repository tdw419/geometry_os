; DESCRIPTION: Composite: . Then Places a black 46x93 rectangle at position (17, 11). Then Places a magenta dot at position (75, 210).
; PLAN: r0=17(x), r1=11(y), r2=46(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 46x93 rectangle at position (17, 11).
; PLAN: r0=17(x), r1=11(y), r2=46(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 11
LDI r2, 46
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (75, 210).
; PLAN: r0=75(x), r1=210(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 210
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
