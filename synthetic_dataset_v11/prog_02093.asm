; DESCRIPTION: Composite: . Then Places a red circle of radius 57 at center (93, 190). Then Draws a green rectangle at (98, 36) with width 28 and height 119.
; PLAN: r0=93(x), r1=190(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=98(x), r1=36(y), r2=28(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 57 at center (93, 190).
; PLAN: r0=93(x), r1=190(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 190
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (98, 36) with width 28 and height 119.
; PLAN: r0=98(x), r1=36(y), r2=28(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 36
LDI r2, 28
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
