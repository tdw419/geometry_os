; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (199, 245). Then Places a cyan 108x95 rectangle at position (83, 15).
; PLAN: r0=199(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=83(x), r1=15(y), r2=108(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single cyan pixel at (199, 245).
; PLAN: r0=199(x), r1=245(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 245
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan 108x95 rectangle at position (83, 15).
; PLAN: r0=83(x), r1=15(y), r2=108(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 15
LDI r2, 108
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
