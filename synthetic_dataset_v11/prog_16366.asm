; DESCRIPTION: Composite: . Then Places a cyan dot at position (140, 223). Then Renders a black box of size 17x112 starting at (209, 36).
; PLAN: r0=140(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=209(x), r1=36(y), r2=17(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (140, 223).
; PLAN: r0=140(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 223
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 17x112 starting at (209, 36).
; PLAN: r0=209(x), r1=36(y), r2=17(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 36
LDI r2, 17
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
