; DESCRIPTION: Composite: . Then Places a black 88x30 rectangle at position (22, 222). Then Places a yellow dot at position (78, 239).
; PLAN: r0=22(x), r1=222(y), r2=88(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=78(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 88x30 rectangle at position (22, 222).
; PLAN: r0=22(x), r1=222(y), r2=88(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 222
LDI r2, 88
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (78, 239).
; PLAN: r0=78(x), r1=239(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 78
LDI r1, 239
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
