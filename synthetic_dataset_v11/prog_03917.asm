; DESCRIPTION: Composite: . Then Places a cyan 37x88 rectangle at position (108, 87). Then Places a purple dot at position (180, 104).
; PLAN: r0=108(x), r1=87(y), r2=37(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=180(x), r1=104(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan 37x88 rectangle at position (108, 87).
; PLAN: r0=108(x), r1=87(y), r2=37(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 87
LDI r2, 37
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (180, 104).
; PLAN: r0=180(x), r1=104(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 104
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
