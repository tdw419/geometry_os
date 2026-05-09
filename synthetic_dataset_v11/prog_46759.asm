; DESCRIPTION: Composite: . Then Places a yellow dot at position (50, 132). Then Draws a yellow rectangle at (178, 18) with width 65 and height 27.
; PLAN: r0=50(x), r1=132(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=178(x), r1=18(y), r2=65(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (50, 132).
; PLAN: r0=50(x), r1=132(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 132
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow rectangle at (178, 18) with width 65 and height 27.
; PLAN: r0=178(x), r1=18(y), r2=65(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 18
LDI r2, 65
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
