; DESCRIPTION: Composite: . Then Places a green dot at position (122, 89). Then Draws a yellow rectangle at (9, 45) with width 33 and height 16.
; PLAN: r0=122(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=9(x), r1=45(y), r2=33(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (122, 89).
; PLAN: r0=122(x), r1=89(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 89
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow rectangle at (9, 45) with width 33 and height 16.
; PLAN: r0=9(x), r1=45(y), r2=33(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 45
LDI r2, 33
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
