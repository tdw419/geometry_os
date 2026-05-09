; DESCRIPTION: Composite: . Then Places a cyan dot at position (232, 139). Then Places a orange 31x15 rectangle at position (69, 28).
; PLAN: r0=232(x), r1=139(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=69(x), r1=28(y), r2=31(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (232, 139).
; PLAN: r0=232(x), r1=139(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 139
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Places a orange 31x15 rectangle at position (69, 28).
; PLAN: r0=69(x), r1=28(y), r2=31(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 28
LDI r2, 31
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
