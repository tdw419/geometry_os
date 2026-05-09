; DESCRIPTION: Composite: . Then Places a green dot at position (163, 112). Then Renders a yellow box of size 76x105 starting at (173, 5).
; PLAN: r0=163(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=173(x), r1=5(y), r2=76(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (163, 112).
; PLAN: r0=163(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 112
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow box of size 76x105 starting at (173, 5).
; PLAN: r0=173(x), r1=5(y), r2=76(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 5
LDI r2, 76
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
