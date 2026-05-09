; DESCRIPTION: Composite: . Then Draws a black rectangle at (160, 204) with width 72 and height 32. Then Sets a single blue pixel at (63, 111).
; PLAN: r0=160(x), r1=204(y), r2=72(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=63(x), r1=111(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a black rectangle at (160, 204) with width 72 and height 32.
; PLAN: r0=160(x), r1=204(y), r2=72(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 204
LDI r2, 72
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single blue pixel at (63, 111).
; PLAN: r0=63(x), r1=111(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 63
LDI r1, 111
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
