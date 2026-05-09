; DESCRIPTION: Draws a cyan rectangle at (115, 134) with width 111 and height 94.
; PLAN: r0=115(x), r1=134(y), r2=111(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 134
LDI r2, 111
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
