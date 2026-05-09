; DESCRIPTION: Composite: . Then Places a yellow dot at position (39, 30). Then Renders a black box of size 13x104 starting at (53, 63).
; PLAN: r0=39(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=53(x), r1=63(y), r2=13(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (39, 30).
; PLAN: r0=39(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 13x104 starting at (53, 63).
; PLAN: r0=53(x), r1=63(y), r2=13(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 63
LDI r2, 13
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
