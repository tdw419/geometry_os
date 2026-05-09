; DESCRIPTION: Composite: . Then Renders a green line between points (199, 145) and (91, 126). Then Creates a red circular shape at (153, 191) with radius 28.
; PLAN: r0=199(x1), r1=145(y1), r2=91(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=153(x), r1=191(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green line between points (199, 145) and (91, 126).
; PLAN: r0=199(x1), r1=145(y1), r2=91(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 145
LDI r2, 91
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a red circular shape at (153, 191) with radius 28.
; PLAN: r0=153(x), r1=191(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 191
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
