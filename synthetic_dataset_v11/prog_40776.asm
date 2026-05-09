; DESCRIPTION: Composite: . Then Places a white dot at position (189, 37). Then Renders a yellow box of size 21x118 starting at (165, 107).
; PLAN: r0=189(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=165(x), r1=107(y), r2=21(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (189, 37).
; PLAN: r0=189(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 21x118 starting at (165, 107).
; PLAN: r0=165(x), r1=107(y), r2=21(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 107
LDI r2, 21
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
