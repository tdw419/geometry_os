; DESCRIPTION: Composite: . Then Draws a white rectangle at (19, 84) with width 83 and height 118. Then Places a green dot at position (161, 161).
; PLAN: r0=19(x), r1=84(y), r2=83(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=161(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white rectangle at (19, 84) with width 83 and height 118.
; PLAN: r0=19(x), r1=84(y), r2=83(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 84
LDI r2, 83
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (161, 161).
; PLAN: r0=161(x), r1=161(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 161
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
