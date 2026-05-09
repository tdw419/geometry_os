; DESCRIPTION: Composite: . Then Places a black dot at position (31, 45). Then Draws a cyan rectangle at (189, 130) with width 19 and height 57.
; PLAN: r0=31(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=189(x), r1=130(y), r2=19(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (31, 45).
; PLAN: r0=31(x), r1=45(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 45
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan rectangle at (189, 130) with width 19 and height 57.
; PLAN: r0=189(x), r1=130(y), r2=19(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 130
LDI r2, 19
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
