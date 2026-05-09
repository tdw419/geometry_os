; DESCRIPTION: Composite: . Then Draws a green circle centered at (74, 99) with radius 40. Then Places a cyan dot at position (16, 9).
; PLAN: r0=74(x), r1=99(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=16(x), r1=9(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green circle centered at (74, 99) with radius 40.
; PLAN: r0=74(x), r1=99(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 99
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan dot at position (16, 9).
; PLAN: r0=16(x), r1=9(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 9
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
