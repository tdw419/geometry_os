; DESCRIPTION: Draws a cyan rectangle at (384, 2) with width 52 and height 109.
; PLAN: r0=384(x), r1=2(y), r2=52(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 2
LDI r2, 52
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
