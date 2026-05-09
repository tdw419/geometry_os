; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (141, 129). Then Places a green 20x100 rectangle at position (122, 84).
; PLAN: r0=141(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=122(x), r1=84(y), r2=20(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (141, 129).
; PLAN: r0=141(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 141
LDI r1, 129
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a green 20x100 rectangle at position (122, 84).
; PLAN: r0=122(x), r1=84(y), r2=20(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 84
LDI r2, 20
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
