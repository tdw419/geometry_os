; DESCRIPTION: Draws a cyan rectangle at (46, 134) with width 78 and height 78.
; PLAN: r0=46(x), r1=134(y), r2=78(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 134
LDI r2, 78
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
