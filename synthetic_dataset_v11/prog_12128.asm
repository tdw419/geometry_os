; DESCRIPTION: Composite: . Then Places a white 83x101 rectangle at position (1, 84). Then Sets a single orange pixel at (96, 144).
; PLAN: r0=1(x), r1=84(y), r2=83(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=96(x), r1=144(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 83x101 rectangle at position (1, 84).
; PLAN: r0=1(x), r1=84(y), r2=83(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 84
LDI r2, 83
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (96, 144).
; PLAN: r0=96(x), r1=144(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 96
LDI r1, 144
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
