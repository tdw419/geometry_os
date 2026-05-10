; DESCRIPTION: Draws a cyan rectangle at (294, 100) with width 39 and height 43.
; PLAN: r0=294(x), r1=100(y), r2=39(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 100
LDI r2, 39
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
