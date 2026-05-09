; DESCRIPTION: Composite: . Then Renders a purple box of size 110x66 starting at (130, 83). Then Places a cyan dot at position (245, 218).
; PLAN: r0=130(x), r1=83(y), r2=110(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=245(x), r1=218(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple box of size 110x66 starting at (130, 83).
; PLAN: r0=130(x), r1=83(y), r2=110(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 83
LDI r2, 110
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (245, 218).
; PLAN: r0=245(x), r1=218(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 245
LDI r1, 218
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
