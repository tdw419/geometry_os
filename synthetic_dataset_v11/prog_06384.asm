; DESCRIPTION: Composite: . Then Sets a single green pixel at (30, 38). Then Places a green 50x71 rectangle at position (165, 47).
; PLAN: r0=30(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=165(x), r1=47(y), r2=50(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (30, 38).
; PLAN: r0=30(x), r1=38(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 38
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a green 50x71 rectangle at position (165, 47).
; PLAN: r0=165(x), r1=47(y), r2=50(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 47
LDI r2, 50
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
