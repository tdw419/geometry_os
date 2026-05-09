; DESCRIPTION: Composite: . Then Draws a white rectangle at (99, 128) with width 120 and height 52. Then Places a magenta dot at position (249, 67).
; PLAN: r0=99(x), r1=128(y), r2=120(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=249(x), r1=67(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a white rectangle at (99, 128) with width 120 and height 52.
; PLAN: r0=99(x), r1=128(y), r2=120(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 128
LDI r2, 120
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (249, 67).
; PLAN: r0=249(x), r1=67(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 249
LDI r1, 67
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
