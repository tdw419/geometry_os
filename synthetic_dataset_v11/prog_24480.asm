; DESCRIPTION: Composite: . Then Places a green dot at position (76, 88). Then Draws a red rectangle at (155, 152) with width 63 and height 52.
; PLAN: r0=76(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=155(x), r1=152(y), r2=63(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (76, 88).
; PLAN: r0=76(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 76
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a red rectangle at (155, 152) with width 63 and height 52.
; PLAN: r0=155(x), r1=152(y), r2=63(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 152
LDI r2, 63
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
