; DESCRIPTION: Composite: . Then Draws a purple rectangle at (111, 50) with width 15 and height 16. Then Places a green dot at position (63, 235).
; PLAN: r0=111(x), r1=50(y), r2=15(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=63(x), r1=235(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a purple rectangle at (111, 50) with width 15 and height 16.
; PLAN: r0=111(x), r1=50(y), r2=15(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 50
LDI r2, 15
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (63, 235).
; PLAN: r0=63(x), r1=235(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 235
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
