; DESCRIPTION: Composite: . Then Places a cyan dot at position (90, 209). Then Draws a cyan circle centered at (202, 142) with radius 13.
; PLAN: r0=90(x), r1=209(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=202(x), r1=142(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan dot at position (90, 209).
; PLAN: r0=90(x), r1=209(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 209
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan circle centered at (202, 142) with radius 13.
; PLAN: r0=202(x), r1=142(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 142
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
