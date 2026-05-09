; DESCRIPTION: Composite: . Then Places a yellow dot at position (88, 129). Then Renders a white box of size 77x43 starting at (94, 157).
; PLAN: r0=88(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=94(x), r1=157(y), r2=77(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (88, 129).
; PLAN: r0=88(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 129
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a white box of size 77x43 starting at (94, 157).
; PLAN: r0=94(x), r1=157(y), r2=77(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 157
LDI r2, 77
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
