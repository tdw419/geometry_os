; DESCRIPTION: Composite: . Then Draws a black rectangle at (57, 20) with width 75 and height 25. Then Places a black dot at position (12, 243).
; PLAN: r0=57(x), r1=20(y), r2=75(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=12(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (57, 20) with width 75 and height 25.
; PLAN: r0=57(x), r1=20(y), r2=75(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 20
LDI r2, 75
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (12, 243).
; PLAN: r0=12(x), r1=243(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 243
LDI r2, 0x000000
PSET r0, r1, r2
HALT
