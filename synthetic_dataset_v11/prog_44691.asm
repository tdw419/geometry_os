; DESCRIPTION: Composite: . Then Draws a green rectangle at (50, 21) with width 109 and height 80. Then Places a purple dot at position (77, 214).
; PLAN: r0=50(x), r1=21(y), r2=109(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=77(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (50, 21) with width 109 and height 80.
; PLAN: r0=50(x), r1=21(y), r2=109(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 21
LDI r2, 109
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (77, 214).
; PLAN: r0=77(x), r1=214(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 77
LDI r1, 214
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
