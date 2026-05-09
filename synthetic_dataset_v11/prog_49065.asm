; DESCRIPTION: Composite: . Then Sets a single magenta pixel at (46, 98). Then Draws a green rectangle at (51, 117) with width 25 and height 34.
; PLAN: r0=46(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=51(x), r1=117(y), r2=25(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single magenta pixel at (46, 98).
; PLAN: r0=46(x), r1=98(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 46
LDI r1, 98
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (51, 117) with width 25 and height 34.
; PLAN: r0=51(x), r1=117(y), r2=25(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 117
LDI r2, 25
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
