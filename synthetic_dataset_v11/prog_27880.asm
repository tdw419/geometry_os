; DESCRIPTION: Composite: . Then Places a white 15x91 rectangle at position (120, 111). Then Sets a single purple pixel at (111, 159).
; PLAN: r0=120(x), r1=111(y), r2=15(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=111(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 15x91 rectangle at position (120, 111).
; PLAN: r0=120(x), r1=111(y), r2=15(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 111
LDI r2, 15
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (111, 159).
; PLAN: r0=111(x), r1=159(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 159
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
