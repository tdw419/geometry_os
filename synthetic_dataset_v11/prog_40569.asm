; DESCRIPTION: Composite: . Then Places a cyan 25x25 rectangle at position (108, 52). Then Sets a single orange pixel at (34, 94).
; PLAN: r0=108(x), r1=52(y), r2=25(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=34(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 25x25 rectangle at position (108, 52).
; PLAN: r0=108(x), r1=52(y), r2=25(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 52
LDI r2, 25
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (34, 94).
; PLAN: r0=34(x), r1=94(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 94
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
