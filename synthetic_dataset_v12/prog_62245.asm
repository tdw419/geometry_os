; DESCRIPTION: Draws a cyan rectangle at (108, 130) with width 113 and height 107.
; PLAN: r0=108(x), r1=130(y), r2=113(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 130
LDI r2, 113
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
