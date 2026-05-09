; DESCRIPTION: Composite: . Then Places a yellow dot at position (35, 3). Then Draws a white rectangle at (175, 10) with width 21 and height 95.
; PLAN: r0=35(x), r1=3(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=175(x), r1=10(y), r2=21(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow dot at position (35, 3).
; PLAN: r0=35(x), r1=3(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 35
LDI r1, 3
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (175, 10) with width 21 and height 95.
; PLAN: r0=175(x), r1=10(y), r2=21(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 10
LDI r2, 21
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
