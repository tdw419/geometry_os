; DESCRIPTION: Composite: . Then Places a magenta 19x64 rectangle at position (70, 52). Then Places a cyan dot at position (137, 6).
; PLAN: r0=70(x), r1=52(y), r2=19(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=137(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a magenta 19x64 rectangle at position (70, 52).
; PLAN: r0=70(x), r1=52(y), r2=19(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 52
LDI r2, 19
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (137, 6).
; PLAN: r0=137(x), r1=6(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 6
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
