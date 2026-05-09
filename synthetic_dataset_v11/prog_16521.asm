; DESCRIPTION: Composite: . Then Renders a orange disk with center (174, 117) and radius 33. Then Places a cyan dot at position (192, 126).
; PLAN: r0=174(x), r1=117(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=192(x), r1=126(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange disk with center (174, 117) and radius 33.
; PLAN: r0=174(x), r1=117(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 117
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (192, 126).
; PLAN: r0=192(x), r1=126(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 126
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
