; DESCRIPTION: Composite: . Then Sets a single red pixel at (184, 232). Then Places a cyan 52x21 rectangle at position (29, 20).
; PLAN: r0=184(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=29(x), r1=20(y), r2=52(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (184, 232).
; PLAN: r0=184(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 184
LDI r1, 232
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan 52x21 rectangle at position (29, 20).
; PLAN: r0=29(x), r1=20(y), r2=52(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 20
LDI r2, 52
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
