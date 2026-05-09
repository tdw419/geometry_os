; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (30, 39) with width 25 and height 87. Then Places a red dot at position (91, 58).
; PLAN: r0=30(x), r1=39(y), r2=25(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=91(x), r1=58(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a yellow rectangle at (30, 39) with width 25 and height 87.
; PLAN: r0=30(x), r1=39(y), r2=25(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 39
LDI r2, 25
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (91, 58).
; PLAN: r0=91(x), r1=58(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 58
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
