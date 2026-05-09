; DESCRIPTION: Composite: . Then Renders a yellow box of size 21x66 starting at (129, 87). Then Places a white dot at position (162, 171).
; PLAN: r0=129(x), r1=87(y), r2=21(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=162(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 21x66 starting at (129, 87).
; PLAN: r0=129(x), r1=87(y), r2=21(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 87
LDI r2, 21
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (162, 171).
; PLAN: r0=162(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
