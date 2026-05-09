; DESCRIPTION: Composite: . Then Draws a red rectangle at (84, 118) with width 96 and height 64. Then Places a white dot at position (13, 133).
; PLAN: r0=84(x), r1=118(y), r2=96(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=13(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red rectangle at (84, 118) with width 96 and height 64.
; PLAN: r0=84(x), r1=118(y), r2=96(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 118
LDI r2, 96
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white dot at position (13, 133).
; PLAN: r0=13(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
