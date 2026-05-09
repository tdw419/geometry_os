; DESCRIPTION: Composite: . Then Places a purple dot at position (127, 14). Then Places a cyan circle of radius 26 at center (152, 52).
; PLAN: r0=127(x), r1=14(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=152(x), r1=52(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple dot at position (127, 14).
; PLAN: r0=127(x), r1=14(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 127
LDI r1, 14
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 26 at center (152, 52).
; PLAN: r0=152(x), r1=52(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 52
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
