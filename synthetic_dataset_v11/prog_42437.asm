; DESCRIPTION: Draws a cyan rectangle at (46, 40) with width 74 and height 113.
; PLAN: r0=46(x), r1=40(y), r2=74(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 40
LDI r2, 74
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
