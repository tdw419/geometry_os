; DESCRIPTION: Draws a cyan rectangle at (257, 90) with width 60 and height 13.
; PLAN: r0=257(x), r1=90(y), r2=60(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 90
LDI r2, 60
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
