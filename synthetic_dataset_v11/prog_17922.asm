; DESCRIPTION: Composite: . Then Places a black dot at position (97, 31). Then Places a blue 13x15 rectangle at position (218, 55).
; PLAN: r0=97(x), r1=31(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=218(x), r1=55(y), r2=13(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (97, 31).
; PLAN: r0=97(x), r1=31(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 97
LDI r1, 31
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Places a blue 13x15 rectangle at position (218, 55).
; PLAN: r0=218(x), r1=55(y), r2=13(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 55
LDI r2, 13
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
