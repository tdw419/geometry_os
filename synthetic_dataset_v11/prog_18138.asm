; DESCRIPTION: Composite: . Then Draws a red rectangle at (59, 139) with width 68 and height 71. Then Places a yellow dot at position (103, 72).
; PLAN: r0=59(x), r1=139(y), r2=68(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=103(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (59, 139) with width 68 and height 71.
; PLAN: r0=59(x), r1=139(y), r2=68(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 139
LDI r2, 68
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow dot at position (103, 72).
; PLAN: r0=103(x), r1=72(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 72
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
