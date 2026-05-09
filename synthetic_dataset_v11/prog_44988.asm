; DESCRIPTION: Composite: . Then Places a white 67x28 rectangle at position (120, 219). Then Places a yellow dot at position (112, 147).
; PLAN: r0=120(x), r1=219(y), r2=67(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=112(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a white 67x28 rectangle at position (120, 219).
; PLAN: r0=120(x), r1=219(y), r2=67(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 219
LDI r2, 67
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (112, 147).
; PLAN: r0=112(x), r1=147(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 147
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
