; DESCRIPTION: Composite: . Then Places a white 74x48 rectangle at position (165, 31). Then Sets a single cyan pixel at (173, 50).
; PLAN: r0=165(x), r1=31(y), r2=74(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x), r1=50(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 74x48 rectangle at position (165, 31).
; PLAN: r0=165(x), r1=31(y), r2=74(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 31
LDI r2, 74
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single cyan pixel at (173, 50).
; PLAN: r0=173(x), r1=50(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 50
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
