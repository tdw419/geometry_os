; DESCRIPTION: Composite: . Then Renders a green box of size 55x47 starting at (148, 126). Then Places a yellow dot at position (199, 10).
; PLAN: r0=148(x), r1=126(y), r2=55(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=199(x), r1=10(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green box of size 55x47 starting at (148, 126).
; PLAN: r0=148(x), r1=126(y), r2=55(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 126
LDI r2, 55
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (199, 10).
; PLAN: r0=199(x), r1=10(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 199
LDI r1, 10
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
