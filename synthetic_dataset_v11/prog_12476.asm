; DESCRIPTION: Composite: . Then Places a yellow dot at position (15, 74). Then Renders a black box of size 63x18 starting at (13, 55).
; PLAN: r0=15(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=13(x), r1=55(y), r2=63(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (15, 74).
; PLAN: r0=15(x), r1=74(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 74
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 63x18 starting at (13, 55).
; PLAN: r0=13(x), r1=55(y), r2=63(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 55
LDI r2, 63
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
