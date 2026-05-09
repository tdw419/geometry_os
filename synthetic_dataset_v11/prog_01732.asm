; DESCRIPTION: Composite: . Then Draws a red rectangle at (233, 111) with width 23 and height 16. Then Places a red dot at position (42, 34).
; PLAN: r0=233(x), r1=111(y), r2=23(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=42(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (233, 111) with width 23 and height 16.
; PLAN: r0=233(x), r1=111(y), r2=23(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 111
LDI r2, 23
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (42, 34).
; PLAN: r0=42(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 42
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
