; DESCRIPTION: Composite: . Then Sets a single green pixel at (165, 113). Then Places a yellow 23x37 rectangle at position (153, 64).
; PLAN: r0=165(x), r1=113(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=153(x), r1=64(y), r2=23(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (165, 113).
; PLAN: r0=165(x), r1=113(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 113
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a yellow 23x37 rectangle at position (153, 64).
; PLAN: r0=153(x), r1=64(y), r2=23(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 64
LDI r2, 23
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
