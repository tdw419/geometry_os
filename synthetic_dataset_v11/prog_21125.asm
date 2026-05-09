; DESCRIPTION: Composite: . Then Places a cyan circle of radius 10 at center (97, 12). Then Places a cyan dot at position (177, 231).
; PLAN: r0=97(x), r1=12(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=177(x), r1=231(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan circle of radius 10 at center (97, 12).
; PLAN: r0=97(x), r1=12(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 12
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (177, 231).
; PLAN: r0=177(x), r1=231(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 177
LDI r1, 231
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
