; DESCRIPTION: Composite: . Then Places a blue 77x33 rectangle at position (156, 211). Then Sets a single purple pixel at (249, 227).
; PLAN: r0=156(x), r1=211(y), r2=77(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=227(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue 77x33 rectangle at position (156, 211).
; PLAN: r0=156(x), r1=211(y), r2=77(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 211
LDI r2, 77
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (249, 227).
; PLAN: r0=249(x), r1=227(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 227
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
