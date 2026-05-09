; DESCRIPTION: Composite: . Then Places a yellow dot at position (239, 178). Then Renders a white line between points (26, 126) and (163, 203).
; PLAN: r0=239(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=26(x1), r1=126(y1), r2=163(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (239, 178).
; PLAN: r0=239(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white line between points (26, 126) and (163, 203).
; PLAN: r0=26(x1), r1=126(y1), r2=163(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 126
LDI r2, 163
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
