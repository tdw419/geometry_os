; DESCRIPTION: Composite: . Then Renders a white line between points (50, 191) and (83, 164). Then Places a yellow dot at position (239, 56).
; PLAN: r0=50(x1), r1=191(y1), r2=83(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=239(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white line between points (50, 191) and (83, 164).
; PLAN: r0=50(x1), r1=191(y1), r2=83(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 191
LDI r2, 83
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (239, 56).
; PLAN: r0=239(x), r1=56(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 56
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
