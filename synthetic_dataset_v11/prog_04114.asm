; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (197, 184) with width 49 and height 27. Then Places a purple dot at position (41, 155).
; PLAN: r0=197(x), r1=184(y), r2=49(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=41(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a cyan rectangle at (197, 184) with width 49 and height 27.
; PLAN: r0=197(x), r1=184(y), r2=49(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 184
LDI r2, 49
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (41, 155).
; PLAN: r0=41(x), r1=155(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 155
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
