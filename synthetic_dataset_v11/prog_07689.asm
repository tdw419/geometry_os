; DESCRIPTION: Composite: . Then Sets a single blue pixel at (104, 86). Then Places a white 59x40 rectangle at position (150, 188).
; PLAN: r0=104(x), r1=86(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=150(x), r1=188(y), r2=59(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (104, 86).
; PLAN: r0=104(x), r1=86(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 104
LDI r1, 86
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a white 59x40 rectangle at position (150, 188).
; PLAN: r0=150(x), r1=188(y), r2=59(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 188
LDI r2, 59
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
