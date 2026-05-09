; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (43, 54). Then Draws a white rectangle at (103, 131) with width 88 and height 52.
; PLAN: r0=43(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=103(x), r1=131(y), r2=88(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (43, 54).
; PLAN: r0=43(x), r1=54(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 43
LDI r1, 54
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a white rectangle at (103, 131) with width 88 and height 52.
; PLAN: r0=103(x), r1=131(y), r2=88(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 131
LDI r2, 88
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
