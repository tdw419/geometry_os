; DESCRIPTION: Composite: . Then Draws a green rectangle at (108, 10) with width 26 and height 54. Then Places a white dot at position (74, 213).
; PLAN: r0=108(x), r1=10(y), r2=26(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=74(x), r1=213(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (108, 10) with width 26 and height 54.
; PLAN: r0=108(x), r1=10(y), r2=26(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 10
LDI r2, 26
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (74, 213).
; PLAN: r0=74(x), r1=213(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 213
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
