; DESCRIPTION: Composite: . Then Draws a purple circle centered at (231, 55) with radius 14. Then Places a cyan dot at position (176, 43).
; PLAN: r0=231(x), r1=55(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=176(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple circle centered at (231, 55) with radius 14.
; PLAN: r0=231(x), r1=55(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 231
LDI r1, 55
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (176, 43).
; PLAN: r0=176(x), r1=43(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 43
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
