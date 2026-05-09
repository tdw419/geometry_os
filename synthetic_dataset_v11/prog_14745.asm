; DESCRIPTION: Composite: . Then Places a black 40x38 rectangle at position (20, 4). Then Places a cyan dot at position (29, 129).
; PLAN: r0=20(x), r1=4(y), r2=40(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=29(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black 40x38 rectangle at position (20, 4).
; PLAN: r0=20(x), r1=4(y), r2=40(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 4
LDI r2, 40
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan dot at position (29, 129).
; PLAN: r0=29(x), r1=129(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 129
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
