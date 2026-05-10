; DESCRIPTION: Draws a cyan rectangle at (358, 5) with width 24 and height 109.
; PLAN: r0=358(x), r1=5(y), r2=24(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 5
LDI r2, 24
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
