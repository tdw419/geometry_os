; DESCRIPTION: Composite: . Then Sets a single green pixel at (198, 198). Then Places a magenta 78x49 rectangle at position (143, 35).
; PLAN: r0=198(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=143(x), r1=35(y), r2=78(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (198, 198).
; PLAN: r0=198(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a magenta 78x49 rectangle at position (143, 35).
; PLAN: r0=143(x), r1=35(y), r2=78(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 35
LDI r2, 78
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
