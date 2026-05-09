; DESCRIPTION: Composite: . Then Places a green 36x84 rectangle at position (144, 99). Then Sets a single yellow pixel at (161, 144).
; PLAN: r0=144(x), r1=99(y), r2=36(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=161(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a green 36x84 rectangle at position (144, 99).
; PLAN: r0=144(x), r1=99(y), r2=36(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 99
LDI r2, 36
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (161, 144).
; PLAN: r0=161(x), r1=144(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 144
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
